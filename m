Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185E346ADB
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304189; cv=none; b=oWfoimtJvrSobIIYlPAT+G2ixT1PzqAlYik70piFBi10EDXC7CeXqgxx16AKdmPEKY1ZSQuK8Nqp6iVGZmmL06cRucf8mJoUGJ96TAKojhZjNMudIvNn6zPKdiFsetVcL71/YiXZQDAE95DspzAZvJZ8qfT/N/dKS4YIMAZMk6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304189; c=relaxed/simple;
	bh=4wMQfX6Kle/MFiReAZEPCyCBJu3NFGqOMPpoVrvH9WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6xJvCEEuSMEQbAnOUQkrpYkIK3Yxung4hyOfEuP9TgaW139g9OTgU4lfLpk1p3wdeHc7SxgmKeJNKX9VltxOiq+bT7POuorY7T7U5VCikvPFZt2L47MD/AlkXOY0Zaq0JHseTpl24/AXlVy86K/ShiJdJRTk2Vhd91VlAfw788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HC4ytn6Y; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=QxdM4nRW; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HC4ytn6Y; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=QxdM4nRW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HC4ytn6Y";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="QxdM4nRW";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HC4ytn6Y";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="QxdM4nRW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D22A5BCCC;
	Tue, 13 Jan 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768304185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJ5cavQhfMNLjb9ejqhkN22eAsIM+CtbUjXUZXIrff8=;
	b=HC4ytn6Y0QQJv53sFE8z/zRgYZDd62Geq2MjI4xaZi5YFzhV5R/T+dpxb7ELkk1gSJiEn9
	et44uCX9x3VdmMOl1opzuslGAiPoaFJTz5854VAsirAILdq9YcDOroxqmcnOR1WLX/By5G
	jQrE0NVV3phMZrH+OOH7+ry/7SBDuMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768304185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJ5cavQhfMNLjb9ejqhkN22eAsIM+CtbUjXUZXIrff8=;
	b=QxdM4nRWa2uLRI/kcO01xzghTvSDyFR2Z3zeQw4ogmLrStrWTcZkEKdIuOUFXzNkyUm+xb
	HUONFCMSReYFnPBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=HC4ytn6Y;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=QxdM4nRW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768304185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJ5cavQhfMNLjb9ejqhkN22eAsIM+CtbUjXUZXIrff8=;
	b=HC4ytn6Y0QQJv53sFE8z/zRgYZDd62Geq2MjI4xaZi5YFzhV5R/T+dpxb7ELkk1gSJiEn9
	et44uCX9x3VdmMOl1opzuslGAiPoaFJTz5854VAsirAILdq9YcDOroxqmcnOR1WLX/By5G
	jQrE0NVV3phMZrH+OOH7+ry/7SBDuMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768304185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJ5cavQhfMNLjb9ejqhkN22eAsIM+CtbUjXUZXIrff8=;
	b=QxdM4nRWa2uLRI/kcO01xzghTvSDyFR2Z3zeQw4ogmLrStrWTcZkEKdIuOUFXzNkyUm+xb
	HUONFCMSReYFnPBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 440B23EA65;
	Tue, 13 Jan 2026 11:36:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IBzSDzkuZmnDHwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 13 Jan 2026 11:36:25 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH v3 1/3] Documentation: Remove :manpage: from non-existing man pages
Date: Tue, 13 Jan 2026 12:36:08 +0100
Message-ID: <20260113113612.315748-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113113612.315748-1-pvorel@suse.cz>
References: <20260113113612.315748-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:mid,suse.cz:email];
	URIBL_BLOCKED(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6D22A5BCCC
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Removing :manpage: from non-existing man pages (xyzzy(2), xyzzyat(2),
fxyzzy(3) in adding-syscalls.rst, including translations) prevent
adding link to nonexisting man pages when using manpages_url in next
commit.

While at it, add also missing '(2)' in sp_SP translation.

Reviewed-by: Alejandro Colomar <alx@kernel.org>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v2->v3:
* Remove `...` (italic) from non-existing man pages (Jonathan).
* Squash fix for sp_SP to this commit (Jonathan).
* Remove :manpage: also from fxyzzy(3) (non-existing man page).

 Documentation/process/adding-syscalls.rst        | 16 ++++++++--------
 .../it_IT/process/adding-syscalls.rst            | 16 ++++++++--------
 .../sp_SP/process/adding-syscalls.rst            | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
index fc0b0bbcd34df..e8892f03eadd5 100644
--- a/Documentation/process/adding-syscalls.rst
+++ b/Documentation/process/adding-syscalls.rst
@@ -111,7 +111,7 @@ should use a file descriptor as the handle for that object -- don't invent a
 new type of userspace object handle when the kernel already has mechanisms and
 well-defined semantics for using file descriptors.
 
-If your new :manpage:`xyzzy(2)` system call does return a new file descriptor,
+If your new xyzzy(2) system call does return a new file descriptor,
 then the flags argument should include a value that is equivalent to setting
 ``O_CLOEXEC`` on the new FD.  This makes it possible for userspace to close
 the timing window between ``xyzzy()`` and calling
@@ -127,18 +127,18 @@ descriptor. Making a file descriptor ready for reading or writing is the
 normal way for the kernel to indicate to userspace that an event has
 occurred on the corresponding kernel object.
 
-If your new :manpage:`xyzzy(2)` system call involves a filename argument::
+If your new xyzzy(2) system call involves a filename argument::
 
     int sys_xyzzy(const char __user *path, ..., unsigned int flags);
 
-you should also consider whether an :manpage:`xyzzyat(2)` version is more appropriate::
+you should also consider whether an xyzzyat(2) version is more appropriate::
 
     int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int flags);
 
 This allows more flexibility for how userspace specifies the file in question;
 in particular it allows userspace to request the functionality for an
 already-opened file descriptor using the ``AT_EMPTY_PATH`` flag, effectively
-giving an :manpage:`fxyzzy(3)` operation for free::
+giving an fxyzzy(3) operation for free::
 
  - xyzzyat(AT_FDCWD, path, ..., 0) is equivalent to xyzzy(path,...)
  - xyzzyat(fd, "", ..., AT_EMPTY_PATH) is equivalent to fxyzzy(fd, ...)
@@ -147,11 +147,11 @@ giving an :manpage:`fxyzzy(3)` operation for free::
 :manpage:`openat(2)` man page; for an example of AT_EMPTY_PATH, see the
 :manpage:`fstatat(2)` man page.)
 
-If your new :manpage:`xyzzy(2)` system call involves a parameter describing an
+If your new xyzzy(2) system call involves a parameter describing an
 offset within a file, make its type ``loff_t`` so that 64-bit offsets can be
 supported even on 32-bit architectures.
 
-If your new :manpage:`xyzzy(2)` system call involves privileged functionality,
+If your new xyzzy(2) system call involves privileged functionality,
 it needs to be governed by the appropriate Linux capability bit (checked with
 a call to ``capable()``), as described in the :manpage:`capabilities(7)` man
 page.  Choose an existing capability bit that governs related functionality,
@@ -160,7 +160,7 @@ under the same bit, as this goes against capabilities' purpose of splitting
 the power of root.  In particular, avoid adding new uses of the already
 overly-general ``CAP_SYS_ADMIN`` capability.
 
-If your new :manpage:`xyzzy(2)` system call manipulates a process other than
+If your new xyzzy(2) system call manipulates a process other than
 the calling process, it should be restricted (using a call to
 ``ptrace_may_access()``) so that only a calling process with the same
 permissions as the target process, or with the necessary capabilities, can
@@ -196,7 +196,7 @@ be cc'ed to linux-api@vger.kernel.org.
 Generic System Call Implementation
 ----------------------------------
 
-The main entry point for your new :manpage:`xyzzy(2)` system call will be called
+The main entry point for your new xyzzy(2) system call will be called
 ``sys_xyzzy()``, but you add this entry point with the appropriate
 ``SYSCALL_DEFINEn()`` macro rather than explicitly.  The 'n' indicates the
 number of arguments to the system call, and the macro takes the system call name
diff --git a/Documentation/translations/it_IT/process/adding-syscalls.rst b/Documentation/translations/it_IT/process/adding-syscalls.rst
index df8c652d004b1..c4ed6dbf5f057 100644
--- a/Documentation/translations/it_IT/process/adding-syscalls.rst
+++ b/Documentation/translations/it_IT/process/adding-syscalls.rst
@@ -124,7 +124,7 @@ descrittore di file per accesso all'oggetto - non inventatevi nuovi tipi di
 accesso da spazio utente quando il kernel ha già dei meccanismi e una semantica
 ben definita per utilizzare i descrittori di file.
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` ritorna un nuovo
+Se la vostra nuova chiamata di sistema xyzzy(2) ritorna un nuovo
 descrittore di file, allora l'argomento *flags* dovrebbe includere un valore
 equivalente a ``O_CLOEXEC`` per i nuovi descrittori.  Questo rende possibile,
 nello spazio utente, la chiusura della finestra temporale fra le chiamate a
@@ -140,13 +140,13 @@ della famiglia di :manpage:`poll(2)`. Rendere un descrittore di file pronto
 per la lettura o la scrittura è il tipico modo del kernel per notificare lo
 spazio utente circa un evento associato all'oggetto del kernel.
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` ha un argomento
+Se la vostra nuova chiamata di sistema xyzzy(2) ha un argomento
 che è il percorso ad un file::
 
     int sys_xyzzy(const char __user *path, ..., unsigned int flags);
 
 dovreste anche considerare se non sia più appropriata una versione
-:manpage:`xyzzyat(2)`::
+`xyzzyat(2)`::
 
     int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int flags);
 
@@ -154,7 +154,7 @@ Questo permette più flessibilità su come lo spazio utente specificherà il fil
 in questione; in particolare, permette allo spazio utente di richiedere la
 funzionalità su un descrittore di file già aperto utilizzando il *flag*
 ``AT_EMPTY_PATH``, in pratica otterremmo gratuitamente l'operazione
-:manpage:`fxyzzy(3)`::
+fxyzzy(3)::
 
  - xyzzyat(AT_FDCWD, path, ..., 0) is equivalent to xyzzy(path,...)
  - xyzzyat(fd, "", ..., AT_EMPTY_PATH) is equivalent to fxyzzy(fd, ...)
@@ -163,12 +163,12 @@ funzionalità su un descrittore di file già aperto utilizzando il *flag*
 man :manpage:`openat(2)`; per un esempio di AT_EMPTY_PATH, leggere la pagina
 man :manpage:`fstatat(2)`).
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` prevede un parametro
+Se la vostra nuova chiamata di sistema xyzzy(2) prevede un parametro
 per descrivere uno scostamento all'interno di un file, usate ``loff_t`` come
 tipo cosicché scostamenti a 64-bit potranno essere supportati anche su
 architetture a 32-bit.
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` prevede l'uso di
+Se la vostra nuova chiamata di sistema xyzzy(2) prevede l'uso di
 funzioni riservate, allora dev'essere gestita da un opportuno bit di privilegio
 (verificato con una chiamata a ``capable()``), come descritto nella pagina man
 :manpage:`capabilities(7)`.  Scegliete un bit di privilegio già esistente per
@@ -178,7 +178,7 @@ principio di *capabilities* di separare i poteri di root.  In particolare,
 evitate di aggiungere nuovi usi al fin-troppo-generico privilegio
 ``CAP_SYS_ADMIN``.
 
-Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` manipola altri
+Se la vostra nuova chiamata di sistema xyzzy(2) manipola altri
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
index f21504c612b25..5f7445b62637a 100644
--- a/Documentation/translations/sp_SP/process/adding-syscalls.rst
+++ b/Documentation/translations/sp_SP/process/adding-syscalls.rst
@@ -128,7 +128,7 @@ manipulador de ese objeto -- no invente un nuevo tipo de objeto manipulador
 userspace cuando el kernel ya tiene mecanismos y semánticas bien definidas
 para usar los descriptores de archivos.
 
-Si su nueva llamada a sistema :manpage:`xyzzy(2)` retorna un nuevo
+Si su nueva llamada a sistema xyzzy(2) retorna un nuevo
 descriptor de archivo, entonces el argumento flag debe incluir un valor que
 sea equivalente a definir ``O_CLOEXEC`` en el nuevo FD. Esto hace posible
 al userspace acortar la brecha de tiempo entre ``xyzzy()`` y la llamada a
@@ -145,12 +145,12 @@ archivo listo para leer o escribir es la forma normal para que el kernel
 indique al espacio de usuario que un evento ha ocurrido en el
 correspondiente objeto del kernel.
 
-Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra algún nombre
+Si su nueva llamada de sistema xyzzy(2) involucra algún nombre
 de archivo como argumento::
 
     int sys_xyzzy(const char __user *path, ..., unsigned int flags);
 
-debería considerar también si una versión :manpage:`xyzzyat(2)` es mas
+debería considerar también si una versión xyzzyat(2) es mas
 apropiada::
 
     int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int flags);
@@ -158,7 +158,7 @@ apropiada::
 Esto permite más flexibilidad en como el userspace especifica el archivo en
 cuestión; en particular esto permite al userspace pedir la funcionalidad a
 un descriptor de archivo ya abierto usando el flag ``AT_EMPTY_PATH``,
-efectivamente dando una operación :manpage:`fxyzzy(3)` gratis::
+efectivamente dando una operación fxyzzy(3) gratis::
 
  - xyzzyat(AT_FDCWD, path, ..., 0) es equivalente a xyzzy(path, ...)
  - xyzzyat(fd, "", ..., AT_EMPTY_PATH) es equivalente a fxyzzy(fd, ...)
@@ -167,12 +167,12 @@ efectivamente dando una operación :manpage:`fxyzzy(3)` gratis::
 revise el man page :manpage:`openat(2)`; para un ejemplo de AT_EMPTY_PATH,
 mire el man page :manpage:`fstatat(2)` manpage.)
 
-Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra un parámetro
+Si su nueva llamada de sistema xyzzy(2) involucra un parámetro
 describiendo un describiendo un movimiento dentro de un archivo, ponga de
 tipo ``loff_t`` para que movimientos de 64-bit puedan ser soportados
 incluso en arquitecturas de 32-bit.
 
-Si su nueva llamada de sistema  :manpage:`xyzzy` involucra una
+Si su nueva llamada de sistema xyzzy(2) involucra una
 funcionalidad privilegiada, esta necesita ser gobernada por la capability
 bit linux apropiada (revisado con una llamada a ``capable()``), como se
 describe en el man page :manpage:`capabilities(7)`. Elija una parte de
@@ -182,7 +182,7 @@ misma sección, ya que va en contra de los propósitos de las capabilities de
 dividir el poder del usuario root. En particular, evite agregar nuevos usos
 de la capacidad ya demasiado general de la capabilities ``CAP_SYS_ADMIN``.
 
-Si su nueva llamada de sistema :manpage:`xyzzy(2)` manipula un proceso que
+Si su nueva llamada de sistema xyzzy(2) manipula un proceso que
 no es el proceso invocado, este debería ser restringido (usando una llamada
 a ``ptrace_may_access()``) de forma que el único proceso con los mismos
 permisos del proceso objetivo, o con las capacidades (capabilities)
@@ -221,7 +221,7 @@ kernel, debería siempre ser copiado a linux-api@vger.kernel.org.
 Implementation de Llamada de Sistema Generica
 ---------------------------------------------
 
-La entrada principal a su nueva llamada de sistema :manpage:`xyzzy(2)` será
+La entrada principal a su nueva llamada de sistema xyzzy(2) será
 llamada ``sys_xyzzy()``, pero incluya este punto de entrada con la macro
 ``SYSCALL_DEFINEn()`` apropiada en vez de explicitamente. El 'n' indica el
 numero de argumentos de la llamada de sistema, y la macro toma el nombre de
-- 
2.51.0

