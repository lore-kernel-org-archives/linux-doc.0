Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194713;
	b=wTT1pcL3sRmwy0ckKlGyo3cBJgO4fKWoVP4kp4GXTcr59z7haax0jPreZrKr3puJHHVE
	 xPa8ek4Ev2y/o0jycQi2fuQ0BGRn1m7Ypohcshr9kBl0xpw3dmFxrv3jo+wV09JbO2n7Q
	 QqcBkhlyV63HFN2pip1jxpdLAvHoOOimqEkDGowhotPsMGuVsGJDH8UbygGG1gY4tWLvv
	 hVQITH9JHn+Zapt9hJ0a59/EsB8zxiH1x4WmIbNJJbbDw9yd5sEBw30FGZWXTPBvXx9GB
	 oEN5isu4uDDqvPqd3sK3/R5L+O44Wj5RxZChsQQU36MgLH66fkIO4zXHU8G2qSGJSpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eTaG4po7JA0cxHHzPKYf/i0rJCeMPEuRJN+blMdHnPo=;
	b=Ly2UJPrZOdDCwJsBGZ6Xted/3wk1zmaaeM8CTSsqyl0/Hi0sW7JedkuOScbkdysOo6Tr
	 NZOo0zJIls2YnK9fZ8j6qk7GXABu7WMAsjGIhgp4wO2RSvuHOif4jIH0PBkFeOPmS+kHV
	 tezZCtwcUSqp10ernwmH7nszOu9+g514WKolIFME1MvSKzT3COXkT8K7Z4ECaI8wr92vq
	 ozDXhWs2NQypcUsBjiSXV5Gz+3cnZvYrohdnvrXG0C3kiulemfOyrj05jGvmeQtk+EJju
	 VG5IUbGE48rT2fai9K5vy3l0HrEHE+oLAQftnKYqSQRKWgWOoJ4/qX+iDCguE+pZpcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvVTg2dR;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AB9606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 03:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99AB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvVTg2dR
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b331cad3cfso2645587b3.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 19:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794194711; x=1794799511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTaG4po7JA0cxHHzPKYf/i0rJCeMPEuRJN+blMdHnPo=;
        b=PvVTg2dR3OKpP6HA7e7DbCF1MMxbk5NaYLH96vkhoAn5lQd3YrGLlsO0jwmJErNu00
         vZNjutx4Ef34lntLPR1OQfgGInJq7nUZc10ZQYnMAUuHENnVmG3HUKzW/CXNQ9wa8f6q
         tMtZBBb8UXGge06ygaecVzmBm2WClKmNqjjOwREYT8trqbjKxiSKrzw5STtjvguewHxW
         SDoHTKSKmtVFSdse6UzYblJXOHCN4rGOME7ZDY3n+TpaOgLpqrDVX2spc7+WYfKY6hnB
         r9ya/j0bJrEL6JvOjJfAPkFAYo0L2VqUr2DrP9ZUygI6D5osMCzwA4Tf4bQpLAnULQni
         ujpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794194711; x=1794799511;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eTaG4po7JA0cxHHzPKYf/i0rJCeMPEuRJN+blMdHnPo=;
        b=gSZjN8/wLTapte4p4owwiN9KO+SvK3wDTVTjaOiyiB4ySdroYSYsVRyNlHu4nzGsYX
         xQ2P+I/ko7XXGuA7w5OnSPyPpNUD2IlI7JDT7jZ1sby5I06NJ65KQxEacttvBPg/nvcY
         +gzN4kJKdnaWa9CU/bFA7aPNzTvfHz2pWNb8lWNTjJHAiMu083gy6/YLD94m8DMYHpPQ
         1tQs/dRU7eYCSIiY9pmxqtwX5QT3KCnSwUASfGKt1ZBtyn3jNqCYPIB5oYTvFM3K85X0
         e7nJPhym8yv8uA5zRnvC3baf+L80kSIPtlaLeFSS9YI8aXrTg8QAKOp5iFSDH3yWUZTO
         OqwQ==
X-Forwarded-Encrypted: i=1; AL+hErEWnOQ28LWbRNCRPVAEBnltPhehcT/UdLI1W6EG0hqL5/MMqIpLj/7RtY7xH1deVMWTeMys8TFCyqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D6q97n9R6AM0MgbOHomlWD+YEb7U+KQ/YNsM68RZ6G0dJekvy
	6d0ANqJdkCsUF0zgvxGfDyaICSQcYWTwiWZFeHMQA73qbvZQ7NQcr+Sf
X-Gm-Gg: AYBFou1a3/mruuUu/vEvUX0q3AFjM+NJfEarJa6bW5eiyCDkR0w5Juv8hzna7UPE5iD
	TmAC0+pQ+4wkIs8JErPIh+oylMVv1ycF5vbUCmqGI6hX2GQE2Dw8BiI9T8TzyIaQStVCqo404x1
	Hqr/6EqXdGWKyFCcueXyICOwRob9ASilrRYwrjf2kzwpVK+QcvNXqYFtSFMtJSopT02CGzxtzzN
	IpSd3ucv0U58RamERHEr9zQtRrOe2jJWONjuGNxnbzPq72QscwapRgQGK882bJXRyUw0WCbEwiF
	pirZY2lpGuEanvc95MpzPqilxTSZ/ZQoLBqy8Phy20H2VZEgKSPm8xZ6sD1wdXBOI/St4x1H8wJ
	x/Nw75W2lwFel/Rez6Wdtft5SmG5BZFt1I6+mdckIWNGU+bcyWq3NuCwpnhMSjNBUwZozFwM3so
	qjOtRRgcmWA7/Vl9/s1MOOycSkr7+s7Z/3a7JZntNmz78uQh77KQSa+INIg0z6BDZhjUmYRMakO
	u4N2aT9UyjmIuDrpmlUZqHv4q4aUD8ZWsIfQ4+ToUbiU/jB5R68avyMYsVkuLZxy7UB4NFUc+I5
	0ImQq7DaBJCddGVk3OCfqzcWu+bN6w==
X-Received: by 2002:a05:690c:83:b0:8b2:e27b:95db with SMTP id 00721157ae682-8b36c844f03mr21523687b3.2.1794194711580;
        Sun, 08 Nov 2026 19:25:11 -0800 (PST)
Received: from pop-os ([2804:14c:daa2:8daa:7f0e:a9ca:25e0:599f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bb42553sm26782717b3.15.2026.11.08.19.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:25:11 -0800 (PST)
From: Giovanna Macedo Cox <giovannamccds@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Giovanna Macedo Cox <giovannamccds@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate gdb-kernel-debugging
Date: Mon,  9 Nov 2026 00:24:53 -0300
Message-ID: <20261109032455.33944-1-giovannamccds@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate gdb-kernel-debugging to Brazilian Portuguese
and add toctree section in index.

Signed-off-by: Giovanna Macedo Cox <giovannamccds@gmail.com>
---
 .../debugging/gdb-kernel-debugging.rst        | 187 ++++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   6 +-
 2 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/gdb-kernel-debugging.rst

diff --git a/Documentation/translations/pt_BR/process/debugging/gdb-kernel-debugging.rst b/Documentation/translations/pt_BR/process/debugging/gdb-kernel-debugging.rst
new file mode 100644
index 000000000..cc1146aea
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/debugging/gdb-kernel-debugging.rst
@@ -0,0 +1,187 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. highlight:: none
+
+Depuração do kernel e módulos via gdb
+=====================================
+
+O depurador de kernel kgdb, hipervisores como o QEMU ou interfaces de
+hardware baseadas em JTAG permitem depurar o kernel do Linux e seus módulos
+durante a execução utilizando o gdb. O gdb vem com um poderoso script de
+interface python. O kernel fornece uma coleção de scripts de ajuda que
+podem simplificar passos de depuração típicos do kernel. Este é um pequeno
+tutorial sobre como habilitar e usá-los. Ele se concentra em máquinas
+virtuais QEMU/KVM como destino, mas os exemplos também podem ser adaptados
+para outros stubs do gdb.
+
+Requisitos
+----------
+
+- gdb 7.2+ (recomendado: 7.4+) com suporte python habilitado (normalmente
+  habilitados em distribuições)
+
+Configurações:
+--------------
+
+- Crie uma máquina virtual Linux para QEMU/KVM (veja www.linux-kvm.org
+  www.qemu.org para mais detalhes). Para desenvolvimento cruzado,
+  https://landley.net/aboriginal/bin mantém um conjunto de imagens de
+  máquinas e conjuntos de ferramentas que podem ser úteis como ponto de
+  partida.
+
+- Construa (Build) o kernel com CONFIG_GDB_SCRIPTS habilitado, mas deixe
+  CONFIG_DEBUG_INFO_REDUCED desabilitado. Se sua arquitetura suportar
+  CONFIG_FRAME_POINTER, mantenha habilitado.
+
+- Instale esse kernel no sistema convidado e desative o KASLR se
+  necessário, adicionando “nokaslr” à linha de comando do kernel. Como
+  alternativa, o QEMU permite inicializar o kernel diretamente
+  usando -kernel, -append, -initrd troca de comando de linha. Isso é
+  geralmente usado apenas se você não depender de módulos. Veja a
+  documentação QEMU para mais detalhes sobre esse modo. Nesse caso,
+  você deve construir(Build) o kernel com CONFIG_RANDOMIZE_BASE
+  desabilitado se a arquitetura suportar KASLR.
+
+- Construa os scripts gdb(necessário no kernel v5.1 ou superior)
+
+        - Crie scripts_gdb
+
+- Habilite o stub gdb do QEMU/KVM, seja
+
+    - No momento da inicialização da VM adicione "-s" na linha de
+      comando QEMU
+
+  ou
+
+    - durante o tempo de execução, digitando "gdbserver" no console de
+      monitor QEMU
+
+- cd /path/to/linux-build
+
+- Inicie a gdb: gdb vmlinux
+
+    Observação: algumas distribuições podem restringir o carregamento
+    automático de scripts do gdb a diretórios conhecidos como seguros.
+    Caso o gdb informe que se recusa a carregar o vmlinux-gdb.py,
+    adicione::
+
+        add-auto-load-safe-path /path/to/linux-build
+
+    Para ~/.gdbinit. Veja gdb help para mais detalhes.
+
+- Conecte-se ao sistema convidado já inicializado::
+
+    (gdb) target remote :1234
+
+Exemplos de uso do Linux-provided gdb helpers
+----------------------------------------------
+
+- Carregue os símbolos do módulo (e do kernel principal)::
+
+    (gdb) lx-symbols
+    loading vmlinux
+    scanning for modules in /home/user/linux/build
+    loading @0xffffffffa0020000: /home/user/linux/build/net/netfilter/xt_tcpudp.ko
+    loading @0xffffffffa0016000: /home/user/linux/build/net/netfilter/xt_pkttype.ko
+    loading @0xffffffffa0002000: /home/user/linux/build/net/netfilter/xt_limit.ko
+    loading @0xffffffffa00ca000: /home/user/linux/build/net/packet/af_packet.ko
+    loading @0xffffffffa003c000: /home/user/linux/build/fs/fuse/fuse.ko
+    ...
+    loading @0xffffffffa0000000: /home/user/linux/build/drivers/ata/ata_generic.ko
+
+- Defina um ponto de interrupção em alguma função de um módulo que ainda
+  não foi carregado, por exemplo::
+
+    (gdb) b btrfs_init_sysfs
+    Function "btrfs_init_sysfs" not defined.
+    Make breakpoint pending on future shared library load? (y or [n]) y
+    Breakpoint 1 (btrfs_init_sysfs) pending.
+
+- Continue com o alvo::
+
+    (gdb) c
+
+- Carregue o módulo no alvo e veja os símbolos serem carregados, bem como o
+  ponto de interrupção sendo acionado::
+
+    loading @0xffffffffa0034000: /home/user/linux/build/lib/libcrc32c.ko
+    loading @0xffffffffa0050000: /home/user/linux/build/lib/lzo/lzo_compress.ko
+    loading @0xffffffffa006e000: /home/user/linux/build/lib/zlib_deflate/zlib_deflate.ko
+    loading @0xffffffffa01b1000: /home/user/linux/build/fs/btrfs/btrfs.ko
+
+    Breakpoint 1, btrfs_init_sysfs () at /home/user/linux/fs/btrfs/sysfs.c:36
+    36              btrfs_kset = kset_create_and_add("btrfs", NULL, fs_kobj);
+
+- Descarregue o buffer de log do kernel de destino::
+
+    (gdb) lx-dmesg
+    [     0.000000] Initializing cgroup subsys cpuset
+    [     0.000000] Initializing cgroup subsys cpu
+    [     0.000000] Linux version 3.8.0-rc4-dbg+ (...
+    [     0.000000] Command line: root=/dev/sda2 resume=/dev/sda1 vga=0x314
+    [     0.000000] e820: BIOS-provided physical RAM map:
+    [     0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
+    [     0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
+    ....
+
+- Examinar os campos da estrutura da tarefa atual (compatível apenas com
+  x86 e arm64)::
+
+    (gdb) p $lx_per_cpu(runqueues).nr_running
+    $3 = 1
+    (gdb) p $lx_per_cpu(runqueues, 2).nr_running
+    $4 = 0
+
+- Explore os hrtimers usando o auxiliar `container_of`::
+
+    (gdb) set $leftmost = $lx_per_cpu(hrtimer_bases).clock_base[0].active.rb_root.rb_leftmost
+    (gdb) p *$container_of($leftmost, "struct hrtimer", "node")
+    $5 = {
+      node = {
+        node = {
+          __rb_parent_color = 18446612686384860673,
+          rb_right = 0xffff888231da8b00,
+          rb_left = 0x0
+        },
+        expires = 1228461000000
+      },
+      _softexpires = 1228461000000,
+      function = 0xffffffff8137ab20 <tick_nohz_handler>,
+      base = 0xffff888231d9b4c0,
+      state = 1 '\001',
+      is_rel = 0 '\000',
+      is_soft = 0 '\000',
+      is_hard = 1 '\001'
+    }
+
+Lista de comandos e funções
+---------------------------
+
+O número de comandos e funções úteis pode mudar com o tempo; esta é apenas
+uma visão geral da versão inicial::
+
+ (gdb) apropos lx
+ função lx_current -- Voltar à tarefa atual
+ função lx_module -- Encontrar o módulo pelo nome e retornar a variável
+ do módulo
+ função lx_per_cpu -- Retorna a variável por CPU
+ função lx_task_by_pid -- Localiza uma tarefa do Linux pelo PID e retorna a
+ variável `task_struct`
+ função lx_thread_info -- Calcula as informações da thread do Linux a
+ partir da variável da tarefa
+ lx-dmesg -- Exibe o buffer de log do kernel do Linux
+ lx-lsmod -- Lista os módulos carregados no momento
+ lx-symbols -- (Re)carrega os símbolos do kernel do Linux e dos módulos
+ carregados no momento
+
+Detalhes da ajuda podem ser obtidos por "help <command-name>" para
+comandos e "help function <function-name>" para funções.
+
+Depuração de scripts GDB
+------------------------
+
+O GDB não permite um backtrace completo do Python, o que pode tornar a
+depuração de scripts do GDB mais difícil do que o necessário. O código a
+seguir permitirá exibir um backtrace completo do ambiente Python::
+
+ (gdb) set python print-stack full
diff --git a/Documentation/translations/pt_BR/process/debugging/index.rst b/Documentation/translations/pt_BR/process/debugging/index.rst
index b223fae34..179d1a1e3 100644
--- a/Documentation/translations/pt_BR/process/debugging/index.rst
+++ b/Documentation/translations/pt_BR/process/debugging/index.rst
@@ -7,10 +7,14 @@ Dicas de depuração para desenvolvedores do Kernel Linux
 Guias gerais
 ------------
 
+.. toctree::
+    :maxdepth: 1
+
+    Guia de depuração do kernel com gdb <gdb-kernel-debugging>
+
 Todolist:
 
 *   driver_development_debugging_guide
-*   gdb-kernel-debugging
 *   kgdb
 *   userspace_debugging_guide
 
-- 
2.55.0

