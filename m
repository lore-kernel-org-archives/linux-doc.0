Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF71E4AB
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768174550; cv=none; b=FLW7kYsKPAQJ0RX2n9/ah9rXhgR2RNw6uCbbWZ3DSzpk0JcC95L6s+R90GRp4nM7IBp8Ln77BaB7kUdIWvE1+8e7Wmyoy19Vv+2biPWLFQlcocAVvVh6yEj08KnB9gqoGcmytzLp28hKAyTcBLK163htZwvlhhed/wKtJZlQ8CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768174550; c=relaxed/simple;
	bh=iAZ5pTyMYn2GTj6tt2L1A9sE00fO/qhHcNnHwHg4ezw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFjYWM1Ouptpw985+oS+EESD1Ra3lF5FlIci3zFrWkyUE5u0FBlWp3QtRm6GgqjEyGsMnz0TtI5dcH4cVsA1wGqiWs4AUoLVnJo9uHT0InYaZfz0d6fKwZUNAHIX+jqf5OtmOA+fSidzWQcRkTuoAL/1n5kIvQjfflziG4yTkRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=FIHrQPQv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=j8V5cE3C; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=FIHrQPQv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=j8V5cE3C; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="FIHrQPQv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="j8V5cE3C";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="FIHrQPQv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="j8V5cE3C"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BB7435BCFD;
	Sun, 11 Jan 2026 23:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768174541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HeMtrVWiogFkeeK9ZbqJHqQsmUbIUiqzp6PswksI0xg=;
	b=FIHrQPQvt0/f2BglCobtg65MVbXHrcaoOteLEUGUwh8XrmXP5c1d9yeO+y8y7jSSGGSCFm
	RB70Gh5YUAM50B+x0gUvwopgEYViEWlkJq7/NP9kczH7Rgg8tyEP9y51KkZFdi9dIAOBsg
	D29DRWCsQDFGgespcRTw0hFIORNbDBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768174541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HeMtrVWiogFkeeK9ZbqJHqQsmUbIUiqzp6PswksI0xg=;
	b=j8V5cE3CFziADe7VhjtbWIhqeZXiUzgzX14UBprC9zw3xw/5tKhXJ9Nl2Rp+UcKTi/AGKY
	bStDneC5WQiJdwAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768174541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HeMtrVWiogFkeeK9ZbqJHqQsmUbIUiqzp6PswksI0xg=;
	b=FIHrQPQvt0/f2BglCobtg65MVbXHrcaoOteLEUGUwh8XrmXP5c1d9yeO+y8y7jSSGGSCFm
	RB70Gh5YUAM50B+x0gUvwopgEYViEWlkJq7/NP9kczH7Rgg8tyEP9y51KkZFdi9dIAOBsg
	D29DRWCsQDFGgespcRTw0hFIORNbDBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768174541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HeMtrVWiogFkeeK9ZbqJHqQsmUbIUiqzp6PswksI0xg=;
	b=j8V5cE3CFziADe7VhjtbWIhqeZXiUzgzX14UBprC9zw3xw/5tKhXJ9Nl2Rp+UcKTi/AGKY
	bStDneC5WQiJdwAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92A383EA63;
	Sun, 11 Jan 2026 23:35:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oI7+Is0zZGkCFwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Sun, 11 Jan 2026 23:35:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Kerrisk  <mtk@man7.org>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH v2 2/3] Documentation: Remove :manpage: from non-existing man pages
Date: Mon, 12 Jan 2026 00:35:31 +0100
Message-ID: <20260111233534.183272-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111233534.183272-1-pvorel@suse.cz>
References: <20260111233534.183272-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-7.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -7.30
X-Spam-Level: 

Removing :manpage: from non-existing man pages (xyzzy(2), xyzzyat(2),
fxyzzy(3) in adding-syscalls.rst, including translations) prevent
adding link to nonexisting man pages when using manpages_url in next
commit.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2.

 Documentation/process/adding-syscalls.rst          | 14 +++++++-------
 .../translations/it_IT/process/adding-syscalls.rst | 14 +++++++-------
 .../translations/sp_SP/process/adding-syscalls.rst | 14 +++++++-------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
index fc0b0bbcd34df..1f61d0b114120 100644
--- a/Documentation/process/adding-syscalls.rst
+++ b/Documentation/process/adding-syscalls.rst
@@ -111,7 +111,7 @@ should use a file descriptor as the handle for that object -- don't invent a
 new type of userspace object handle when the kernel already has mechanisms and
 well-defined semantics for using file descriptors.
 
-If your new :manpage:`xyzzy(2)` system call does return a new file descriptor,
+If your new `xyzzy(2)` system call does return a new file descriptor,
 then the flags argument should include a value that is equivalent to setting
 ``O_CLOEXEC`` on the new FD.  This makes it possible for userspace to close
 the timing window between ``xyzzy()`` and calling
@@ -127,11 +127,11 @@ descriptor. Making a file descriptor ready for reading or writing is the
 normal way for the kernel to indicate to userspace that an event has
 occurred on the corresponding kernel object.
 
-If your new :manpage:`xyzzy(2)` system call involves a filename argument::
+If your new `xyzzy(2)` system call involves a filename argument::
 
     int sys_xyzzy(const char __user *path, ..., unsigned int flags);
 
-you should also consider whether an :manpage:`xyzzyat(2)` version is more appropriate::
+you should also consider whether an `xyzzyat(2)` version is more appropriate::
 
     int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int flags);
 
@@ -147,11 +147,11 @@ giving an :manpage:`fxyzzy(3)` operation for free::
 :manpage:`openat(2)` man page; for an example of AT_EMPTY_PATH, see the
 :manpage:`fstatat(2)` man page.)
 
-If your new :manpage:`xyzzy(2)` system call involves a parameter describing an
+If your new `xyzzy(2)` system call involves a parameter describing an
 offset within a file, make its type ``loff_t`` so that 64-bit offsets can be
 supported even on 32-bit architectures.
 
-If your new :manpage:`xyzzy(2)` system call involves privileged functionality,
+If your new `xyzzy(2)` system call involves privileged functionality,
 it needs to be governed by the appropriate Linux capability bit (checked with
 a call to ``capable()``), as described in the :manpage:`capabilities(7)` man
 page.  Choose an existing capability bit that governs related functionality,
@@ -160,7 +160,7 @@ under the same bit, as this goes against capabilities' purpose of splitting
 the power of root.  In particular, avoid adding new uses of the already
 overly-general ``CAP_SYS_ADMIN`` capability.
 
-If your new :manpage:`xyzzy(2)` system call manipulates a process other than
+If your new `xyzzy(2)` system call manipulates a process other than
 the calling process, it should be restricted (using a call to
 ``ptrace_may_access()``) so that only a calling process with the same
 permissions as the target process, or with the necessary capabilities, can
@@ -196,7 +196,7 @@ be cc'ed to linux-api@vger.kernel.org.
 Generic System Call Implementation
 ----------------------------------
 
-The main entry point for your new :manpage:`xyzzy(2)` system call will be called
+The main entry point for your new `xyzzy(2)` system call will be called
 ``sys_xyzzy()``, but you add this entry point with the appropriate
 ``SYSCALL_DEFINEn()`` macro rather than explicitly.  The 'n' indicates the
 number of arguments to the system call, and the macro takes the system call name
diff --git a/Documentation/translations/it_IT/process/adding-syscalls.rst b/Documentation/translations/it_IT/process/adding-syscalls.rst
index df8c652d004b1..b8151daf02195 100644
--- a/Documentation/translations/it_IT/process/adding-syscalls.rst
+++ b/Documentation/translations/it_IT/process/adding-syscalls.rst
@@ -124,7 +124,7 @@ descrittore di file per accesso all'oggetto - non inventatevi nuovi tipi di
 accesso da spazio utente quando il kernel ha già dei meccanismi e una semantica
 ben definita per utilizzare i descrittori di file.
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` ritorna un nuovo
+Se la vostra nuova chiamata di sistema `xyzzy(2)` ritorna un nuovo
 descrittore di file, allora l'argomento *flags* dovrebbe includere un valore
 equivalente a ``O_CLOEXEC`` per i nuovi descrittori.  Questo rende possibile,
 nello spazio utente, la chiusura della finestra temporale fra le chiamate a
@@ -140,13 +140,13 @@ della famiglia di :manpage:`poll(2)`. Rendere un descrittore di file pronto
 per la lettura o la scrittura è il tipico modo del kernel per notificare lo
 spazio utente circa un evento associato all'oggetto del kernel.
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` ha un argomento
+Se la vostra nuova chiamata di sistema `xyzzy(2)` ha un argomento
 che è il percorso ad un file::
 
     int sys_xyzzy(const char __user *path, ..., unsigned int flags);
 
 dovreste anche considerare se non sia più appropriata una versione
-:manpage:`xyzzyat(2)`::
+`xyzzyat(2)`::
 
     int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int flags);
 
@@ -163,12 +163,12 @@ funzionalità su un descrittore di file già aperto utilizzando il *flag*
 man :manpage:`openat(2)`; per un esempio di AT_EMPTY_PATH, leggere la pagina
 man :manpage:`fstatat(2)`).
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` prevede un parametro
+Se la vostra nuova chiamata di sistema `xyzzy(2)` prevede un parametro
 per descrivere uno scostamento all'interno di un file, usate ``loff_t`` come
 tipo cosicché scostamenti a 64-bit potranno essere supportati anche su
 architetture a 32-bit.
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` prevede l'uso di
+Se la vostra nuova chiamata di sistema `xyzzy(2)` prevede l'uso di
 funzioni riservate, allora dev'essere gestita da un opportuno bit di privilegio
 (verificato con una chiamata a ``capable()``), come descritto nella pagina man
 :manpage:`capabilities(7)`.  Scegliete un bit di privilegio già esistente per
@@ -178,7 +178,7 @@ principio di *capabilities* di separare i poteri di root.  In particolare,
 evitate di aggiungere nuovi usi al fin-troppo-generico privilegio
 ``CAP_SYS_ADMIN``.
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` manipola altri
+Se la vostra nuova chiamata di sistema `xyzzy(2)` manipola altri
 processi oltre a quello chiamato, allora dovrebbe essere limitata (usando
 la chiamata ``ptrace_may_access()``) di modo che solo un processo chiamante
 con gli stessi permessi del processo in oggetto, o con i necessari privilegi,
@@ -219,7 +219,7 @@ Implementazione di chiamate di sistema generiche
 ------------------------------------------------
 
 Il principale punto d'accesso alla vostra nuova chiamata di sistema
-:manpage:`xyzzy(2)` verrà chiamato ``sys_xyzzy()``; ma, piuttosto che in modo
+`xyzzy(2)` verrà chiamato ``sys_xyzzy()``; ma, piuttosto che in modo
 esplicito, lo aggiungerete tramite la macro ``SYSCALL_DEFINEn``. La 'n'
 indica il numero di argomenti della chiamata di sistema; la macro ha come
 argomento il nome della chiamata di sistema, seguito dalle coppie (tipo, nome)
diff --git a/Documentation/translations/sp_SP/process/adding-syscalls.rst b/Documentation/translations/sp_SP/process/adding-syscalls.rst
index 28f680652383d..4765aa8d58d9f 100644
--- a/Documentation/translations/sp_SP/process/adding-syscalls.rst
+++ b/Documentation/translations/sp_SP/process/adding-syscalls.rst
@@ -128,7 +128,7 @@ manipulador de ese objeto -- no invente un nuevo tipo de objeto manipulador
 userspace cuando el kernel ya tiene mecanismos y semánticas bien definidas
 para usar los descriptores de archivos.
 
-Si su nueva llamada a sistema :manpage:`xyzzy(2)` retorna un nuevo
+Si su nueva llamada a sistema `xyzzy(2)` retorna un nuevo
 descriptor de archivo, entonces el argumento flag debe incluir un valor que
 sea equivalente a definir ``O_CLOEXEC`` en el nuevo FD. Esto hace posible
 al userspace acortar la brecha de tiempo entre ``xyzzy()`` y la llamada a
@@ -145,12 +145,12 @@ archivo listo para leer o escribir es la forma normal para que el kernel
 indique al espacio de usuario que un evento ha ocurrido en el
 correspondiente objeto del kernel.
 
-Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra algún nombre
+Si su nueva llamada de sistema `xyzzy(2)` involucra algún nombre
 de archivo como argumento::
 
     int sys_xyzzy(const char __user *path, ..., unsigned int flags);
 
-debería considerar también si una versión :manpage:`xyzzyat(2)` es mas
+debería considerar también si una versión `xyzzyat(2)` es mas
 apropiada::
 
     int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int flags);
@@ -167,12 +167,12 @@ efectivamente dando una operación :manpage:`fxyzzy(3)` gratis::
 revise el man page :manpage:`openat(2)`; para un ejemplo de AT_EMPTY_PATH,
 mire el man page :manpage:`fstatat(2)` manpage.)
 
-Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra un parámetro
+Si su nueva llamada de sistema `xyzzy(2)` involucra un parámetro
 describiendo un describiendo un movimiento dentro de un archivo, ponga de
 tipo ``loff_t`` para que movimientos de 64-bit puedan ser soportados
 incluso en arquitecturas de 32-bit.
 
-Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra una
+Si su nueva llamada de sistema `xyzzy(2)` involucra una
 funcionalidad privilegiada, esta necesita ser gobernada por la capability
 bit linux apropiada (revisado con una llamada a ``capable()``), como se
 describe en el man page :manpage:`capabilities(7)`. Elija una parte de
@@ -182,7 +182,7 @@ misma sección, ya que va en contra de los propósitos de las capabilities de
 dividir el poder del usuario root. En particular, evite agregar nuevos usos
 de la capacidad ya demasiado general de la capabilities ``CAP_SYS_ADMIN``.
 
-Si su nueva llamada de sistema :manpage:`xyzzy(2)` manipula un proceso que
+Si su nueva llamada de sistema `xyzzy(2)` manipula un proceso que
 no es el proceso invocado, este debería ser restringido (usando una llamada
 a ``ptrace_may_access()``) de forma que el único proceso con los mismos
 permisos del proceso objetivo, o con las capacidades (capabilities)
@@ -221,7 +221,7 @@ kernel, debería siempre ser copiado a linux-api@vger.kernel.org.
 Implementation de Llamada de Sistema Generica
 ---------------------------------------------
 
-La entrada principal a su nueva llamada de sistema :manpage:`xyzzy(2)` será
+La entrada principal a su nueva llamada de sistema `xyzzy(2)` será
 llamada ``sys_xyzzy()``, pero incluya este punto de entrada con la macro
 ``SYSCALL_DEFINEn()`` apropiada en vez de explicitamente. El 'n' indica el
 numero de argumentos de la llamada de sistema, y la macro toma el nombre de
-- 
2.51.0

