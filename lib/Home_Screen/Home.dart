import 'package:flutter/material.dart';

import '../Login/Login_Screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("University App"),
        actions: [Icon(Icons.menu)],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20), // Add some spacing between the button and the image
              Expanded(
                child: Center(
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBQUBxITExIYGBMaGRkVGhsZGBwdGRobGx0bGxweHhgbJC8kGyQpIBwcMjgmLC8wNDg0HSQ5PzkxPi0yNDABCwsLEA8QHhISHjIrJCs4OzIyPzIwMjI1PjIyODA7MjIyMjIyMjI1OzIwMjswMjIyMjIyMjIyMjUyNTsyMjIyMv/AABEIALYBFQMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABQYBAwQCB//EAEgQAAIBAwIDBAUFDgQFBQAAAAECAAMEERIhBTFBBhMiUTJDYYLCFFJxgZEWIzM2QlNicnSSobGy0hU3c8EHs9Hh8CQmg8PE/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAEEBQMC/8QAKREBAAICAQMCBgIDAAAAAAAAAAERAgMEEiFRBTETFEFScZEyYRUzgf/aAAwDAQACEQMRAD8A+zREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQERECB7Teq9/4YjtN6r3/hiBPREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQERECB7Teq9/4YjtN6r3/AIYgT0REBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAge03qvf+GI7Teq9/4YgT0REBERAREQMTSLhO/KahrA1Fc745Zx5Tzd3C07dnckKoycAk/Uqgkn2DcyAt1uK94bhaPybUugPU3q6Mg/gVOnUcDxOfDy0kZJmIFguLlKaA1HVQSFGogZJ2AHmSegnRI204XTR+8OqpVwR3lQ6n9oB2CA/NUKPZOG5asbVqlzVFvQUZZabZfT+nWx4faEGR88xQmPlKfKe71rrxq05GrTyzp5gb85vkHV7q1dBTp1C7BsU6S6i5OklndtgRgeJ2HpHc7SK4lxaobnuXZjVIz8ltDqq4PI1bk4FJT7NB8maIi0WtDXlMVWQuutV1suRqVfnEDcCbKNVXpKyMGVgGBByCDuCCOYle7OiuLurSqULelSChtFMs7h2JOKlQgKzFdzgE7gk7jOeBabXiNSwICodVe36BqbNmog9qMeXzWXyMTBaYXidE5xVQ4DscMMAU2KuSemGBB+gzpqVVWkWYgKAWJJ2AAyST5YkG9u7VOIKUQUWTSMekzlDr1LywQy77E77dTD0r/veDW4IqVLemlFXCqWe5raFIpjGxRTu7bLkYJwriKstcaVyjOwVgSpAYDpnz/86HymKl2i11RnUO2dK58TY54HMgecgrGxuXqPUbTbd4QzhMNVbHIZ3ROZBIDMeeRyHdUFCztteg5d0RmGXqOScAszHXUwPaTgbDpAklqqajKCNS4yOoznGfpwZmpUC0yzEBRuSTgAeZJ5Su1jUp9obo0lDM9G1IByQDrrIzkDcgLp2GOXTnJGjwhS4e4c13ByNYApqemikPCMdCdTfpRMFuv5ZT+RmtrHdBTU1fk6AMls9RjfM4B2mtMfhh+6/wDbNvab8W7z9nrf0NKgiAqxwCdb9Bn0285206fifVw3741REzC1/dLafnh+6/8AbH3S2n54fuv/AGypeH5qn6h/tmZ1U+qqPpUTv8n/AGrf5CPC2fdLafnh+6//AEj7pbT88P3X/tlLtb2lUBwoGMc1G4OcH+E35Toi/WAIx4kZRcSnLndM1OMrb90tp+eH7r/2zfZcYoVq5SnUDOF1EYYHTkDO4HUiU1aalvRX6gv/AHnf2ZGO0Tgcu7qfzt5428boxu3TTy42ZdMQusREqLhERAREQIHtN6r3/hiO03qvf+GIE9ERAREQEREDw7ALknA9sr1lxW4p3apf/J6QqEJS0VGLO+pvDhh83T9o6nAk+NBv8NcoCSul8DcsEZXIA6khcfXKbxfiFvcGpUenWPepotqi27t3aoyjvACMqxqtnlutNPMA+oi3mZWzhdpTSvVCvqKkIMklkQqrimxJycFiRnkGAkXw2tRuDd2tS5pVnZO7emjFtK+JWyx9I5bcgDBIHQSv0bi8uqN3RCAVyf8A1DU1dF0010imHfGalQjGpdlTBzykpZ2la5opRS0+Q2ajQ2rSK7ptqpoF/Bq2BqYnJHLzk1XvJb2nFnfsfRSnV1Xj0QFCOoqP3bBKrU9WRnAYg77yR7GvatwnNqmnciorHNUVB6XenJJb6ZElLuld1behZKWD1XoXLae7pJWOthjnqDkjSOeBnaa6HDbmtXq39Gi1pdeABKhBWvpB1ioq7ANlQDzBTPWJiKStXyUVOHMhQrryzhs5y25yUYEjps3IAcpHcU4LSHBaVOnVFKpSKtQqHGVqZwCfMOWww6h/onGlxeX1M0Klq9rRIK1mZwWboUp4xser+WQNzkcVbg10te2e6vndtYohaNEFWp7O2oY8JJRSX6YGPOIj+0W67Xi9S4o1LdVNG7ZtNzkZFABVUspOz6wB3fnnJzpInNwfidejY8MphbZLepTt6Y1VGSoWKnvAqgYJB048ycc28Onh1vctcVbp7WpTdUJqlmBau61adQKiD8lERlU+TAb7mdfDOEJd8Gd8Y+9rQt3ZCCopjPeKrjK5q5PLdUST2j8HdJdpL+1RkFe6Sk430s3p03IFRWpj0lZQQCRsQD0ndSvqD2SVqVVGooclw4KqqqwbLZ2wD1lKv7K8ub1alKxa3vUUrUrO6mi+FI0KpDBwxxg4GOs38K4TVq8Me0W1q2ak95Wquyu71QVICgbOpKgk7LhdIHiyHTFe5crFR4nRbiTXIqr3Jtg2vOE0q75JJ5YzFjcWl1xAVaFwlQbMyB8kOuArhM5QhdQO24I8pXuI8Er2nCrdkQXHdmoK6qoUMlSulxlafLAKY0jox+rm41wv5Qourqz+S0FZBilTD3blmCgsUGEUZ5YLfwiMY8lyu/ab8W7z9nrf8tpU6PoH9ep/W0sfFrRaXY+5pLq0JbVVGolmwKbcydyZXKPoH9ep/W0tcL3lQ9R/hH5enTPX+JnLdpi2diM4HXr03nZIzjNZxTCKp0sNyF1EY6YyMfTvLe/ZGGEzLP4+M57McY8o7glEC4K7boN/LST/AHSfFP2/xOP4SuW1R6dYMqsTywUABz7cjBzjcyzLnSM8+sqenbevXUzcwu+p6pw2X9JZA2nT2Z/GN/8ATqfzt5zzo7M/jG/+nU/nbzvyv4OPA/2/8XWIiZTaIiICIiBA9pvVe/8ADEdpvVe/8MQJ6IiAiIgIiICaBXQ3DUww1hVcrncKxYKceRKt9hm4nafPLi+NHtba3pLilc5tn1K4VQTmiVLDG4wTj9M9ZMRaJml0q8UoLfLRaqorH0UJ8ZHmF5kbHf2GbL+/pUKGutUVEzjUxwuTyyTsJWOJ/wCZdj+z1Pjnr/iVVU9kLtQfEpolh5aqiY/lJjG5iPKL91hTilBqyoKilmUuq9WVdyQOoGRy85qo8dtXtqlRLim1NN3dWBVOviYbLt59Jy8LLlwbgIMFBQ0knINPB3IHiPjyPIAyqcTVLPtSani/w+vUVa4HoLWGW381zhm6bsCTgrEYxdEzL6Etwptu81DRgtq6aRvn6MTFW6RbQ1WcCmF1lifCF55z5Y6yO7RaalmLc6sVgyMUUswp48ZAUE4OQuf05CdjL5n7LVrep+Gtg9BgQQdKg6Dg7jbb3YiO1pvusqcVoGw78VUNHc6wwKAA4OWGwwRvPNTjNutz3RrIKmnXoJ8Wn52nnj2yhXlF+GPUVFLWF0hXA37msyYH1H+X6ozOXP8AmjR/Y2/5jyemEWsj8ToLZd+aqdzz7wMCmPPUNsTFtxe3qVEVKyMzrrQBhl1+co/KHtE+fsCtPtIifgACQB6IqMrGpj28s/VPHBawr8W4RRrjue4t0qUTnV8o1InJttGAh8O+cMPLM/D7WdT6HT4tQa+agtVTWX0kB8a8tyvMDcb+0ec6GuEFwtMsNZVnC53KqVDHHkCy/bKlwv8AzNvv2dP/AK5wdor00uPW3ERr0LUa2qZVgoonw6gxGk+MM2x3ynlPPSWt/ab8W7z9nrf0NKnR9A/r1P62lr7S/i3efs9b+hpQb+5dGUI+AWfPhB/LbB39gP2CWOPtjXGWWXtCrytM7axx95S8i+LtuoHkR++yL/1ninxpQihkqFsDJ0jc49h9hmitdCrWVgrKMquG5+HU/T6p59Q5OvLRMYzEzNOfp/E2Yb4nKKiLac7nBPN0G7HcDI5nnsZYwcjI5HeV1G2BwfTDb4/L8PT6Z10uMKtNVNNyVCqcKME8tt/MSn6Tvxw6oymvZb9W4+WzpnCL90vOnsz+MT/6dT+dvKzccVdnzTLIMDZkU7k4zz5br585Zey5/wDcDb5+9P8A/nmlt5GG3CYx+ilxuNnqzicvrErtERKLSIiICIiBA9ph+C9/4YjtN6r3/hiBPREQEREBERAj+MOq8Krs4Zqa02ZgrFWKhSSAwIIOAeonJecKoXFNbetTZkRUcAu+MnUo3DAkjSdz5yUurdals9NxlXVkb6GBB/gZ4trfQSS5ZiAuSANhnGygDqftkxNCFvrO2HGaT1Kb993ZWnU71xyB+95DbMw1H24bfPPe3Z62qWD03pMUqMKtRWq1CXbCgamLZbAVds42E7b7hyVqbq5JV1CkA4wQdQZWG6sDuCDsQDO1VwgA6DEXKKQ3DrCjVoW9wEqAhNVMPVqMUDpp2BYgNpYjI335zkp8Ptq1gbVqLmmK1RXRqrkhlJqF2OvJDEqw3/LU4GTicsLUUrJKQJYIoQE4yQowM4AGYp2SrfPVGdTqqnfbw53x5kaQT5IvlFlOCvb0rY0XCvkYt0zVbCq2+DqbBHhG5ydh5TzacEty9SsqMGrriowqudYPI5DY5ciOh6SRvLQVAniI0OHGMcxnAOQdt5st6WmkF1Fue5AHM5xhQAAOX1RYhbetRuKBtGpMU0uMM2vajU7s5bJYHUAVJ3IGRuCA4vZWy8QS4dH79/vKsK1RNsMwUEMAucHA2yx+udllwlKVwXVnyxcvnTh9bs41ADmpdgCN8HBztOjiFiK1u1NmIRlZWGFIYMMbhgRt0i+4524LQPCmod1ik2SyqzLqJ3OplOSSeZJOeuZw2fBrS44TaP3JCIq1aILvrphgGADBsjHh2zgYHlJ5UxSABOwwOp22685psLUUrGlSViVRVQFsZIUADOABnA8ouSkPY2VJuMVqooOtbanUfvWz4kRguA2MYK8uRG3Qz3xWzthw6lbVqbG1JCbu+lNIygdtWogkADcjOkdRJG1pot7X01Azsyu6ZBKnSqDYbgEKOftmy+tRVt9BJUakbIxnKMGHMEc1EX3KcVxZ6uzdSiqsgag9MKzFmXUhABYkkkZ858nu7kvWYhxpKioMswwlQd4uw25VJ9unx/tBYmjxCpTywCMVGAu6Pqekd+mnWn/w+0SzxZxnLpyjtKnzoy+H1YzUx4Rnfb+F12APpttzH+5+2FrHPhcHA1Hxtttpz9kySxzu4wPJf/MxqY7ZcYHku/8A3mn8vq+2P0xPmtv3z+5YWscABwdgT42/J+3YQKxyMOC2MnxtzBJ/mSZkFjgZYYHku+PpHMxljgZYYHMhd8fSOcfL6vtj9QfNbvvn9y8CrnSA6lsfPbpg/wCw+yXX/h/qa9ZmOStHOeY8dQoACfZbn7ZTQHZkRS+okKMhRknlkkbDON/KfS+w9po4Wau5FUhkz+aRQlM+zUAX+moZU5eOGGPTjERfiKaPAnPPKcspmYjzNrTExMzNa5ERAREQIHtN6r3/AIYjtN6r3/hiBPREQEREBERA5L+syWjOqM5GDpUZYjIzgdTjJx1xiVz/ABOoyOFS7ZVda5NSg9NlVatL73TUIusaNe27HHXMtszFiq0OKaKgqdxdGmxqqB3dZ2zrVwWRgWQZZwNsYXA2wJz8S7QmpaVqa2t0NQdVZaFYMB3eVYFVyD3m2x8jLjOS3sKVM/e6SJz9BVX0iCeQ6kDP0CTceEUi7jiNS24U7929VzVqBEw5dwzu4UaVY7LnG2MLzA3ni67RGnxOmjUKppvRFUFKb1HDagCpRAcAA7nzIk7UpKzKSN1bUPYcFf5MftmqhZUkrO6U0V3wXZVAZsctRAyeZ5+cRMCt8J4rctfhPk9cUAxUF6QQaWZsMz1HVgQNOyq328u6nxtzTuiaDnua/dYpqWcphDqC/lHDZwM7Ec8ESdqIGQqwBB2IIyCPaJqtLOnSoaKSKiAk6VUKuSck4HmYuPArVHij92jFLt0osrsz0HWo+sVUI7tUUOFyh2BxzPIGdNPtMTTz8jus5blb1OWTo9IAnUAM9FzuRtmwVKashVgCpBBBGQQdiCDzEyiAKABgAYAHIARceClUu+NV0VqlO2ra3RGRWpVXUFWcMrd2CUYqE5j8rO+DNlrfvXvhVWjc0mxQDJUR0UYdwwGfC21QkkfMHslrmIuPBSt1OI1aPFazVLWp3T4VDRpGozFObP3eSNQbbUB6GPpjeJcbqVGY0qV1TIDIpFtWOQ3dPkjTscq67ZIDZEu057a1SmhWmioCSxCKFBJ5nA6nziJjwU18MqauHUWKOpKIdNTOtdhs5bfUOud8yG7X8D+UWwqIuqqilSgIHeIcFkydgwIDKTyZRnYmWWZiJqbgmLipfC6tPG5xowQp1OudOzAqfQYHZkPiU7HmCfG3XSBjbFRt/Ly2x1n1Hj/ZZLhi9MinVONWRmnUwMDWoIIYDk6kMPMjaUjiHA69InXSdf0grVaf1PSUuB+vTX6Tzmrp5eMxWXuxOR6fljN6+8fn2Qu2BnSBjbFRvq8tvbGx050gadsO3L7BOy3tKj1QFbX0wiPUP2U1IX32SWbg/Y6q7q1XNFPpU1z+rpylD6QXffZlnTZycMY8uWrg7c579o/KK7N8Ba4uNDLpRfDVIz4UPOmCfy3BwRzRC2cM4C/VkUBAAAABgAcgBNFjZU6NstOkoVFGABy9v0knmTuTOqZO3ZOeVy3NWrHXj0wzERObqREQERECB7Teq9/4YjtN6r3/AIYgT0REBERAREQEREBERAREQEREBERAREQEREBERATEzEDEzEQEREBERAREQERECB7Teq9/4YjtN6r3/hiBPREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQERECB7Teq9/wCGI7Teq9/4YgT0REBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAge03qvf+GI7Teq9/4YERAREQEREBERAREQEREBERAge03qvf+GIiB//Z'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                color: Colors.blue,
                height: 80.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen(status: '')),
                    );
                  },
                  child: Text(
                    'Welcome to the System',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}