Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4126F32B100
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896345; cv=none; b=dRCDZ2udtDNNbRCKrAq0m2tD4huwzIlQbLCQq8qw8+a+nofJ9xJY/SDWmUowVGl6MRmU6+CVozDqNfO9AgKfaD7qJ62t85i4ovBg9sEjDb7/01rT4fU/I0lgfirxM6fUhZ79aWutt9DgqjUjF7BoZLehUwddcwR2VVBSIu4iHzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896345; c=relaxed/simple;
	bh=V5ok3ihiqFCc6bmYhoyZHFAuEeRzA730jiDfzp3tsI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZMntiRfgZ9LDDs5AGKj0PYwos+gp6c+Wo0g8pUSEHsZu+g+n2zj+mst+Eho7crkOiyOwOeOu8gC4PRlKy4wo5I/GsRAQ8NLRbs6jAw17mkS8HWo/5KukygRHaMJS/eS7kKK3phe8kba1wFlHwxA2OhdPQlbusFiBEZo59utNdqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH7DDFp9; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH7DDFp9"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4a172ede313so908405e9.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791896342; x=1792501142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubS41ZohAvdQJ8eUZfnOc+bFZozvbJltYH0gQUtIqhc=;
        b=SH7DDFp9zPUZvPAe1rBO8be0OIK8unnmqF7xwyfB/lYv+IuFx/GG5dXr8SjUD6b9AS
         gfHjt++GteuehVFp8D1d/YdOdiaBJoWHA54wtrF45/5xx1F07gW5Y+fLNkEErbRRoAvb
         lJFJKoCO5BcZ8aRCMetOu+QlYgJzgmVyBLVnLdlbrGVqyuxppYRv8k28nFtrQR3WsSaP
         sNyUCrQp5LtJwhzFY/GPvXHcZZVfvXCngKf6wjirkp/T8Lua/aFMpPUafqPeUiGpRd7+
         99GPcXmR25mbNWfF41jqrxXY3CzkI4PjoP+J7K2ehXH0G32ZoNppn0iux/2E2sYlvRkM
         ukhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896342; x=1792501142;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ubS41ZohAvdQJ8eUZfnOc+bFZozvbJltYH0gQUtIqhc=;
        b=wqT2e3GjKLsHSnqSkLxr24iUfRQ+To/FOBENI8QDTP+bMaxBRpMQ44xhTtsUq7WKDd
         Q8rBRmMvpOMN22JvqsKF0IzzyDG48DA4579V3VozP58bcviiczOc4LGimhOYcLixXoJJ
         AUTgJTsvVdKQq6bFf0MIWAs5FFM9935nJzIGG3yj637jSZdOJ0MC9NKsgphy3TpXw/6o
         XHlFc+XyWktw6oouNCYGTXm0PYRTLenIchVpZhs7HyMLbEykTibeiLHHK7PNRsekoVAj
         XsYa5VhOwABkUZLLUe7h4IeHMVKYFFqJWw6/UwWn+gb3XMz2zMkbJPI2eu0RJw+57W65
         4MSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmwvdVT8cw3STEDD5sJb5h+UKbiJBE/YPwjq7wQ9qAllzPJnRIC5zhuMLjwxtJKIBQNz5E2vpAdtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB8vnWYSYSDGGibS7P29A9h4amm3DJoUeJCU5FnRXINV4SU2c7
	7vZHiMLXrAd4WWf9bsPHMdTVG72Zbj3cftj11dzFFxpBbG4avfmJI8V9vxsQ8Lyr2T+DtA==
X-Gm-Gg: AYBFou2m/XfmHmzDmTPcNg71Bnp8cLl+02qos+1fN/71u58qkn48E1vUmvuPrIK865W
	8NDaGniSjJWo1Rq4gvGsank2PfohLaJL6bhKj/lexgorOhb0LHig9QFzFE2//zOMZA8DwwqHP1R
	zRucGR18WeodS3GVAPRwg24ZRqFMPgytER+zZdLZlirfetmt/KNQiakjInX+KEINI+HKScm2+K8
	HwN+fGU7pzCXacD9kVMOoaE6wOHg4dgXs32T6jmWrIEBdIAamnNuzw71mnL0KdK8UzGWfMozytH
	qEAJEQf5QP7ymLXdlUblswcpYtwh9yXvbrSh/hzQpWJIMKmnKL6JkLo6YWSKuxnUzZnyFHmhsm7
	dfw5OqZwt0shp8r4uaNXCFx7ktsp7ZSvX+ia9IheQQEX17DEQOcGFzSSIBveN10ip5dlStYjZs0
	0YRBZYN5T53Jekb6VMgsLKoAFS2SsgKpqt3qk5XWiCAz35G8lwwDK4Xd0YBXVNkHE+McA8vLCkk
	awlEiLvieQsC3A30xoL5ZAuFHSmzQcRjRX3Bw==
X-Received: by 2002:a05:600c:1912:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a18e3ee97dmr207720645e9.0.1791896341892;
        Tue, 13 Oct 2026 05:59:01 -0700 (PDT)
Received: from localhost.localdomain ([160.242.20.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm5113320f8f.20.2026.10.13.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:59:01 -0700 (PDT)
From: "Efraim E. Vander" <efraimvander64@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Efraim E . Vander" <fraimvander64@gmail.com>,
	"Efraim E. Vander" <efraimvander64@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate cpu-load.rst
Date: Tue, 13 Oct 2026 12:58:25 +0000
Message-ID: <20261013125825.3080-1-efraimvander64@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate cpu-load.rst into Brazilian Portuguese and
add it to the pt_BR admin-guide documentation index.

Assisted-by: LLM

Signed-off-by: Efraim E. Vander <efraimvander64@gmail.com>
---
 .../pt_BR/admin-guide/cpu-load.rst            | 126 +++++++++---------
 1 file changed, 65 insertions(+), 61 deletions(-)

diff --git a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst b/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
index 0c76acabe..f0bb48e82 100644
--- a/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
+++ b/Documentation/translations/pt_BR/admin-guide/cpu-load.rst
@@ -1,27 +1,26 @@
-
-
 .. SPDX-License-Identifier: GPL-2.0
 
 =============
 Carga da CPU
 =============
-O Linux exporta diversas informações por meio de `/proc/stat` e `/proc/uptime`, que ferramentas do espaço do usuário (*userland*), como `top(1)`, utilizam para calcular o tempo médio que o sistema passou em determinado estado. Por exemplo:
-
 
-$ iostat
-Linux 2.6.18.3-exp (linmac)     02/20/2007
+O Linux exporta diversas informações por meio de `/proc/stat` e `/proc/uptime`, que ferramentas do espaço do usuário (*userland*), como `top(1)`, utilizam para calcular o tempo médio que o sistema passou em determinado estado, por exemplo::
 
-avg-cpu:  %user   %nice %system %iowait  %steal   %idle
-           10.01    0.00    2.92    5.44    0.00   81.63
+    $ iostat
+    Linux 2.6.18.3-exp (linmac)     02/20/2007
 
+    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
+               10.01    0.00    2.92    5.44    0.00   81.63
 
-Nesse caso, o sistema considera que, durante o período de amostragem padrão, passou 10,01% do tempo executando tarefas no espaço do usuário, 2,92% no kernel e permaneceu ocioso durante 81,63% do tempo total.
+Nesse caso, o sistema considera que, durante o período de amostragem padrão, passou 10,01% do tempo executando tarefas no espaço do usuário, 2,92% no kernel e permaneceu ocioso durante 81,63% do tempo.
 
-Na maioria dos casos, as informações de `/proc/stat` refletem a realidade com bastante precisão. No entanto, devido à natureza da forma como e do momento em que o kernel coleta esses dados, às vezes essas informações não são confiáveis.
+Na maioria dos casos, as informações de `/proc/stat` refletem a realidade com bastante precisão. No entanto, devido à natureza da forma como e do momento em que os dados são coletados, esses valores podem apresentar imprecisões.
 
 Então, como essas informações são coletadas?
-Sempre que uma interrupção do temporizador (*timer interrupt*) é sinalizada, o kernel verifica que tipo de tarefa estava em execução naquele instante e incrementa o contador correspondente ao tipo ou estado dessa tarefa.
-O problema é que o sistema pode ter alternado entre vários estados diversas vezes entre duas interrupções do temporizador. Ainda assim, o contador é incrementado apenas para o último estado observado.
+
+Sempre que uma interrupção do temporizador (*timer interrupt*) é sinalizada, o kernel verifica que tipo de tarefa estava em execução naquele instante e incrementa o contador correspondente.
+
+O problema é que o sistema pode ter alternado entre vários estados diversas vezes entre duas interrupções do temporizador. Ainda assim, o contador é incrementado apenas uma vez, de acordo com o estado observado no instante da interrupção.
 
 Exemplo
 -------
@@ -35,67 +34,72 @@ Imagine um sistema com uma única tarefa que, periodicamente, consome ciclos de
     |_ algo começa a trabalhar             |_ algo entra em suspensão
                                               (mas é despertado pouco depois)
 
-
-Na situação acima, de acordo com `/proc/stat`, a carga do sistema será de 0%, pois a interrupção do temporizador sempre ocorrerá quando o sistema estiver executando o tratador de ociosidade (*idle handler*).
+Na situação acima, de acordo com `/proc/stat`, a carga do sistema será de 0%, pois a interrupção do temporizador sempre ocorrerá quando o sistema estiver executando a tarefa ociosa.
 
 Na realidade, porém, a carga estará mais próxima de 99%.
 
 É possível imaginar muitas outras situações em que esse comportamento do kernel pode gerar informações bastante inconsistentes em `/proc/stat`:
 
 
-        /* gcc -o hog smallhog.c */
-        
-        #include <time.h>
-        #include <limits.h>
-        #include <signal.h>
-        #include <sys/time.h>
-        #define HIST 10
 
-        static volatile sig_atomic_t stop;
+    /* gcc -o hog smallhog.c */
+    #include <time.h>
+    #include <limits.h>
+    #include <signal.h>
+    #include <sys/time.h>
 
-        static void sighandler(int signr)
-        {
-                (void) signr;
-                stop = 1;
-        }
+    #define HIST 10
 
-        static unsigned long hog (unsigned long niters)
-        {
-                stop = 0;
-                while (!stop && --niters);
-                return niters;
-        }
+    static volatile sig_atomic_t stop;
 
-        int main (void)
-        {
-                int i;
-                struct itimerval it = {
-                        .it_interval = { .tv_sec = 0, .tv_usec = 1 },
-                        .it_value    = { .tv_sec = 0, .tv_usec = 1 } };
-                sigset_t set;
-                unsigned long v[HIST];
-                double tmp = 0.0;
-                unsigned long n;
-                signal(SIGALRM, &sighandler);
-                setitimer(ITIMER_REAL, &it, NULL);
-
-                hog (ULONG_MAX);
-                for (i = 0; i < HIST; ++i) v[i] = ULONG_MAX - hog(ULONG_MAX);
-                for (i = 0; i < HIST; ++i) tmp += v[i];
-                tmp /= HIST;
-                n = tmp - (tmp / 3.0);
-
-                sigemptyset(&set);
-                sigaddset(&set, SIGALRM);
-
-                for (;;) {
-                        hog(n);
-                        sigwait(&set, &i);
-                }
-                return 0;
-        }
+    static void sighandler(int signr)
+    {
+        (void) signr;
+        stop = 1;
+    }
 
+    static unsigned long hog(unsigned long niters)
+    {
+        stop = 0;
+        while (!stop && --niters);
+        return niters;
+    }
+
+    int main(void)
+    {
+        int i;
+        struct itimerval it = {
+            .it_interval = { .tv_sec = 0, .tv_usec = 1 },
+            .it_value    = { .tv_sec = 0, .tv_usec = 1 }
+        };
+        sigset_t set;
+        unsigned long v[HIST];
+        double tmp = 0.0;
+        unsigned long n;
+
+        signal(SIGALRM, &sighandler);
+        setitimer(ITIMER_REAL, &it, NULL);
+
+        hog(ULONG_MAX);
+        for (i = 0; i < HIST; ++i)
+            v[i] = ULONG_MAX - hog(ULONG_MAX);
+
+        for (i = 0; i < HIST; ++i)
+            tmp += v[i];
+
+        tmp /= HIST;
+        n = tmp - (tmp / 3.0);
+
+        sigemptyset(&set);
+        sigaddset(&set, SIGALRM);
+
+        for (;;) {
+            hog(n);
+            sigwait(&set, &i);
+        }
 
+        return 0;
+    }
 
 Referências
 -----------
-- 
2.43.0

