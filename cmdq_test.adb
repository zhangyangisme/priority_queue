--
--                       _oo0oo_
--                      o8888888o
--                      88" . "88
--                      (| -_- |)
--                      0\  =  /0
--                    ___/`---'\___
--                  .' \\|     |-- '.
--                 / \\|||  :  |||-- \
--                / _||||| -:- |||||- \
--               |   | \\\  -  --/ |   |
--               | \_|  ''\---/''  |_/ |
--               \  .-\__  '-'  ___/-. /
--             ___'. .'  /--.--\  `. .'___
--          ."" '<  `.___\_<|>_/___.' >' "".
--         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
--         \  \ `_.   \_ __\ /__ _/   .-` /  /
--     =====`-.____`.___ \_____/___.-`___.-'=====
--                       `=---='
--
--
--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
--               佛祖保佑         永无BUG
--
--
--

------------------------------------------------------
-- 
--  优先队列测试程序
--
--  姚飞
------------------------------------------------------
with Text_IO; use Text_IO;

with Priority_Queue; 
with Interfaces; use Interfaces;

procedure Cmdq_Test is 
   
   -- 用户对象
   type MyObject is 
      record 
	 ID: Integer;
	 Val1, Val2, Val3, Val4: Integer;
      end record;
   
   -- 0元
   function Nul return MyObject is 
   begin
      return (others=>0);
   end;
   
   -- 重载 大于等于 运算符 
   function GE(P, Q : in MyObject) return Boolean is 
   begin
      return (P.ID >= Q.ID);
   end GE;
   
   -- 队列实例化
   package Cmd_Queue is new Priority_Queue(Obj=>MyObject, 
				     ">=" => GE,  
				     Nul => Nul);
   use Cmd_Queue;
   
   
   -------------
   -- Test Cases
   -------------
   TmpObj: MyObject;
   
   Test_Data : array(0..31) of Integer := 
     (11, 10, 9, 6, 7, 8,        -- reverse
      10,                        -- repeat
      64,                        -- far bigger 
      45, 46, 47, 48,            -- forward
      1, 2, 3, 4,                -- another reverse
      25, 24, 23, 22,            -- far bigger and reverse
      100, 101, 102,             -- far bigger and forward 
      10,                        -- 3rd repeat 
      15, 15, 15,                -- continue repeat 
      16,                        -- forward
      13, 14, 15, 16);           -- back and forward, 4th repeat
   I : Integer;

begin
   TmpObj := Nul;
   
   for I in Test_Data'Range loop 
      TmpObj.ID := Test_Data(I);
      Insert(TmpObj);
   end loop;
   
   I:=0;
   while (not IsEmpty) loop
      Put(Integer'Image(I));
      Put("->");
      Put(ASCII.HT);
      Put(Integer'Image(Get_Cmd.ID)); New_Line;
      I := I + 1;
   end loop;
end;
