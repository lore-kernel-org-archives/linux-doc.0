Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC6B672
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768176037; cv=none; b=QRzHJ5fSVB9cD0tDPx0o4bsZCUPajQWbtpu4SZxnBeHpMJrMa8mBLLyd9igrueRPbtzGl9sXga42QcQWc4pmpEoAPu0rA+k+Dc37Y0HPYUwNL+Qex/Po9npxz+xrZByyZaPq6KTc68rum962A1b1y3jeeNxhDwyJ7zFTRoL1B/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768176037; c=relaxed/simple;
	bh=wsPlLv6/BpcwoCDzPQ8NPeyB5uV3cvOq0XXz1aX6izY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXArTZVJ6fa5qQmVzd47uW6bTLwQO5+BBIET3WTj02vaQR95SZbpgwnEYKJ+Idt3tK9agiiVEcWgFOUcfJLqjHSqOQ5Kft4JMnJqd3sPiMf0shLc5G5MHm8aXTxYHrLCZy643QnVBfX1e16LWFjT3dDJQL10QpDwF5Ld85lbSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iI3TeBW/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iI3TeBW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBF7C4CEF7;
	Mon, 12 Jan 2026 00:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768176037;
	bh=wsPlLv6/BpcwoCDzPQ8NPeyB5uV3cvOq0XXz1aX6izY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iI3TeBW/9dhG8FNnEqBqTXDMEEIGUG+TcwurL4tiDv6gL/PzzzdeEbxiLZF7fct/2
	 LaiDaV7MnW4jvuw2ccB1oUqZ9jxjCdqw+rjstbrxFwkoXjUU86+bjXSJ68UrGF77+J
	 vXUs5w9CKgeUd69e4VoB6+8znKAZj5BnlFnb/k9H/Yo9+10HqKWo4ZEsW6YFlkhJ1b
	 H1hVaDMsg0JhHnluHHctwHwdmZHEqvrrrwiMkMXerP/r6XdrNwgD4G4wi4006vaGU3
	 /sTMbI6jFFPvmO/wFJAs+Xmk9aVEqdhUL5VHWxkS1eXQfiQNd+8Uc1gVJ4dTHi+J/H
	 8/ND4HLGaMN9A==
Date: Mon, 12 Jan 2026 01:00:33 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH v2 2/3] Documentation: Remove :manpage: from non-existing
 man pages
Message-ID: <aWQ5jpKzm6vuBg3Z@devuan>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-3-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cf4tfyowvzztfkmh"
Content-Disposition: inline
In-Reply-To: <20260111233534.183272-3-pvorel@suse.cz>


--cf4tfyowvzztfkmh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH v2 2/3] Documentation: Remove :manpage: from non-existing
 man pages
Message-ID: <aWQ5jpKzm6vuBg3Z@devuan>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-3-pvorel@suse.cz>
MIME-Version: 1.0
In-Reply-To: <20260111233534.183272-3-pvorel@suse.cz>

On Mon, Jan 12, 2026 at 12:35:31AM +0100, Petr Vorel wrote:
> Removing :manpage: from non-existing man pages (xyzzy(2), xyzzyat(2),
> fxyzzy(3) in adding-syscalls.rst, including translations) prevent
> adding link to nonexisting man pages when using manpages_url in next
> commit.
>=20
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Reviewed-by: Alejandro Colomar <alx@kernel.org>

> ---
> New in v2.
>=20
>  Documentation/process/adding-syscalls.rst          | 14 +++++++-------
>  .../translations/it_IT/process/adding-syscalls.rst | 14 +++++++-------
>  .../translations/sp_SP/process/adding-syscalls.rst | 14 +++++++-------
>  3 files changed, 21 insertions(+), 21 deletions(-)
>=20
> diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/pr=
ocess/adding-syscalls.rst
> index fc0b0bbcd34df..1f61d0b114120 100644
> --- a/Documentation/process/adding-syscalls.rst
> +++ b/Documentation/process/adding-syscalls.rst
> @@ -111,7 +111,7 @@ should use a file descriptor as the handle for that o=
bject -- don't invent a
>  new type of userspace object handle when the kernel already has mechanis=
ms and
>  well-defined semantics for using file descriptors.
> =20
> -If your new :manpage:`xyzzy(2)` system call does return a new file descr=
iptor,
> +If your new `xyzzy(2)` system call does return a new file descriptor,
>  then the flags argument should include a value that is equivalent to set=
ting
>  ``O_CLOEXEC`` on the new FD.  This makes it possible for userspace to cl=
ose
>  the timing window between ``xyzzy()`` and calling
> @@ -127,11 +127,11 @@ descriptor. Making a file descriptor ready for read=
ing or writing is the
>  normal way for the kernel to indicate to userspace that an event has
>  occurred on the corresponding kernel object.
> =20
> -If your new :manpage:`xyzzy(2)` system call involves a filename argument=
::
> +If your new `xyzzy(2)` system call involves a filename argument::
> =20
>      int sys_xyzzy(const char __user *path, ..., unsigned int flags);
> =20
> -you should also consider whether an :manpage:`xyzzyat(2)` version is mor=
e appropriate::
> +you should also consider whether an `xyzzyat(2)` version is more appropr=
iate::
> =20
>      int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int =
flags);
> =20
> @@ -147,11 +147,11 @@ giving an :manpage:`fxyzzy(3)` operation for free::
>  :manpage:`openat(2)` man page; for an example of AT_EMPTY_PATH, see the
>  :manpage:`fstatat(2)` man page.)
> =20
> -If your new :manpage:`xyzzy(2)` system call involves a parameter describ=
ing an
> +If your new `xyzzy(2)` system call involves a parameter describing an
>  offset within a file, make its type ``loff_t`` so that 64-bit offsets ca=
n be
>  supported even on 32-bit architectures.
> =20
> -If your new :manpage:`xyzzy(2)` system call involves privileged function=
ality,
> +If your new `xyzzy(2)` system call involves privileged functionality,
>  it needs to be governed by the appropriate Linux capability bit (checked=
 with
>  a call to ``capable()``), as described in the :manpage:`capabilities(7)`=
 man
>  page.  Choose an existing capability bit that governs related functional=
ity,
> @@ -160,7 +160,7 @@ under the same bit, as this goes against capabilities=
' purpose of splitting
>  the power of root.  In particular, avoid adding new uses of the already
>  overly-general ``CAP_SYS_ADMIN`` capability.
> =20
> -If your new :manpage:`xyzzy(2)` system call manipulates a process other =
than
> +If your new `xyzzy(2)` system call manipulates a process other than
>  the calling process, it should be restricted (using a call to
>  ``ptrace_may_access()``) so that only a calling process with the same
>  permissions as the target process, or with the necessary capabilities, c=
an
> @@ -196,7 +196,7 @@ be cc'ed to linux-api@vger.kernel.org.
>  Generic System Call Implementation
>  ----------------------------------
> =20
> -The main entry point for your new :manpage:`xyzzy(2)` system call will b=
e called
> +The main entry point for your new `xyzzy(2)` system call will be called
>  ``sys_xyzzy()``, but you add this entry point with the appropriate
>  ``SYSCALL_DEFINEn()`` macro rather than explicitly.  The 'n' indicates t=
he
>  number of arguments to the system call, and the macro takes the system c=
all name
> diff --git a/Documentation/translations/it_IT/process/adding-syscalls.rst=
 b/Documentation/translations/it_IT/process/adding-syscalls.rst
> index df8c652d004b1..b8151daf02195 100644
> --- a/Documentation/translations/it_IT/process/adding-syscalls.rst
> +++ b/Documentation/translations/it_IT/process/adding-syscalls.rst
> @@ -124,7 +124,7 @@ descrittore di file per accesso all'oggetto - non inv=
entatevi nuovi tipi di
>  accesso da spazio utente quando il kernel ha gi=C3=A0 dei meccanismi e u=
na semantica
>  ben definita per utilizzare i descrittori di file.
> =20
> -Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` ritorna un nu=
ovo
> +Se la vostra nuova chiamata di sistema `xyzzy(2)` ritorna un nuovo
>  descrittore di file, allora l'argomento *flags* dovrebbe includere un va=
lore
>  equivalente a ``O_CLOEXEC`` per i nuovi descrittori.  Questo rende possi=
bile,
>  nello spazio utente, la chiusura della finestra temporale fra le chiamat=
e a
> @@ -140,13 +140,13 @@ della famiglia di :manpage:`poll(2)`. Rendere un de=
scrittore di file pronto
>  per la lettura o la scrittura =C3=A8 il tipico modo del kernel per notif=
icare lo
>  spazio utente circa un evento associato all'oggetto del kernel.
> =20
> -Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` ha un argomen=
to
> +Se la vostra nuova chiamata di sistema `xyzzy(2)` ha un argomento
>  che =C3=A8 il percorso ad un file::
> =20
>      int sys_xyzzy(const char __user *path, ..., unsigned int flags);
> =20
>  dovreste anche considerare se non sia pi=C3=B9 appropriata una versione
> -:manpage:`xyzzyat(2)`::
> +`xyzzyat(2)`::
> =20
>      int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int =
flags);
> =20
> @@ -163,12 +163,12 @@ funzionalit=C3=A0 su un descrittore di file gi=C3=
=A0 aperto utilizzando il *flag*
>  man :manpage:`openat(2)`; per un esempio di AT_EMPTY_PATH, leggere la pa=
gina
>  man :manpage:`fstatat(2)`).
> =20
> -Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` prevede un pa=
rametro
> +Se la vostra nuova chiamata di sistema `xyzzy(2)` prevede un parametro
>  per descrivere uno scostamento all'interno di un file, usate ``loff_t`` =
come
>  tipo cosicch=C3=A9 scostamenti a 64-bit potranno essere supportati anche=
 su
>  architetture a 32-bit.
> =20
> -Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` prevede l'uso=
 di
> +Se la vostra nuova chiamata di sistema `xyzzy(2)` prevede l'uso di
>  funzioni riservate, allora dev'essere gestita da un opportuno bit di pri=
vilegio
>  (verificato con una chiamata a ``capable()``), come descritto nella pagi=
na man
>  :manpage:`capabilities(7)`.  Scegliete un bit di privilegio gi=C3=A0 esi=
stente per
> @@ -178,7 +178,7 @@ principio di *capabilities* di separare i poteri di r=
oot.  In particolare,
>  evitate di aggiungere nuovi usi al fin-troppo-generico privilegio
>  ``CAP_SYS_ADMIN``.
> =20
> -Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` manipola altri
> +Se la vostra nuova chiamata di sistema `xyzzy(2)` manipola altri
>  processi oltre a quello chiamato, allora dovrebbe essere limitata (usando
>  la chiamata ``ptrace_may_access()``) di modo che solo un processo chiama=
nte
>  con gli stessi permessi del processo in oggetto, o con i necessari privi=
legi,
> @@ -219,7 +219,7 @@ Implementazione di chiamate di sistema generiche
>  ------------------------------------------------
> =20
>  Il principale punto d'accesso alla vostra nuova chiamata di sistema
> -:manpage:`xyzzy(2)` verr=C3=A0 chiamato ``sys_xyzzy()``; ma, piuttosto c=
he in modo
> +`xyzzy(2)` verr=C3=A0 chiamato ``sys_xyzzy()``; ma, piuttosto che in modo
>  esplicito, lo aggiungerete tramite la macro ``SYSCALL_DEFINEn``. La 'n'
>  indica il numero di argomenti della chiamata di sistema; la macro ha come
>  argomento il nome della chiamata di sistema, seguito dalle coppie (tipo,=
 nome)
> diff --git a/Documentation/translations/sp_SP/process/adding-syscalls.rst=
 b/Documentation/translations/sp_SP/process/adding-syscalls.rst
> index 28f680652383d..4765aa8d58d9f 100644
> --- a/Documentation/translations/sp_SP/process/adding-syscalls.rst
> +++ b/Documentation/translations/sp_SP/process/adding-syscalls.rst
> @@ -128,7 +128,7 @@ manipulador de ese objeto -- no invente un nuevo tipo=
 de objeto manipulador
>  userspace cuando el kernel ya tiene mecanismos y sem=C3=A1nticas bien de=
finidas
>  para usar los descriptores de archivos.
> =20
> -Si su nueva llamada a sistema :manpage:`xyzzy(2)` retorna un nuevo
> +Si su nueva llamada a sistema `xyzzy(2)` retorna un nuevo
>  descriptor de archivo, entonces el argumento flag debe incluir un valor =
que
>  sea equivalente a definir ``O_CLOEXEC`` en el nuevo FD. Esto hace posible
>  al userspace acortar la brecha de tiempo entre ``xyzzy()`` y la llamada a
> @@ -145,12 +145,12 @@ archivo listo para leer o escribir es la forma norm=
al para que el kernel
>  indique al espacio de usuario que un evento ha ocurrido en el
>  correspondiente objeto del kernel.
> =20
> -Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra alg=C3=BAn =
nombre
> +Si su nueva llamada de sistema `xyzzy(2)` involucra alg=C3=BAn nombre
>  de archivo como argumento::
> =20
>      int sys_xyzzy(const char __user *path, ..., unsigned int flags);
> =20
> -deber=C3=ADa considerar tambi=C3=A9n si una versi=C3=B3n :manpage:`xyzzy=
at(2)` es mas
> +deber=C3=ADa considerar tambi=C3=A9n si una versi=C3=B3n `xyzzyat(2)` es=
 mas
>  apropiada::
> =20
>      int sys_xyzzyat(int dfd, const char __user *path, ..., unsigned int =
flags);
> @@ -167,12 +167,12 @@ efectivamente dando una operaci=C3=B3n :manpage:`fx=
yzzy(3)` gratis::
>  revise el man page :manpage:`openat(2)`; para un ejemplo de AT_EMPTY_PAT=
H,
>  mire el man page :manpage:`fstatat(2)` manpage.)
> =20
> -Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra un par=C3=
=A1metro
> +Si su nueva llamada de sistema `xyzzy(2)` involucra un par=C3=A1metro
>  describiendo un describiendo un movimiento dentro de un archivo, ponga de
>  tipo ``loff_t`` para que movimientos de 64-bit puedan ser soportados
>  incluso en arquitecturas de 32-bit.
> =20
> -Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra una
> +Si su nueva llamada de sistema `xyzzy(2)` involucra una
>  funcionalidad privilegiada, esta necesita ser gobernada por la capability
>  bit linux apropiada (revisado con una llamada a ``capable()``), como se
>  describe en el man page :manpage:`capabilities(7)`. Elija una parte de
> @@ -182,7 +182,7 @@ misma secci=C3=B3n, ya que va en contra de los prop=
=C3=B3sitos de las capabilities de
>  dividir el poder del usuario root. En particular, evite agregar nuevos u=
sos
>  de la capacidad ya demasiado general de la capabilities ``CAP_SYS_ADMIN`=
`.
> =20
> -Si su nueva llamada de sistema :manpage:`xyzzy(2)` manipula un proceso q=
ue
> +Si su nueva llamada de sistema `xyzzy(2)` manipula un proceso que
>  no es el proceso invocado, este deber=C3=ADa ser restringido (usando una=
 llamada
>  a ``ptrace_may_access()``) de forma que el =C3=BAnico proceso con los mi=
smos
>  permisos del proceso objetivo, o con las capacidades (capabilities)
> @@ -221,7 +221,7 @@ kernel, deber=C3=ADa siempre ser copiado a linux-api@=
vger.kernel.org.
>  Implementation de Llamada de Sistema Generica
>  ---------------------------------------------
> =20
> -La entrada principal a su nueva llamada de sistema :manpage:`xyzzy(2)` s=
er=C3=A1
> +La entrada principal a su nueva llamada de sistema `xyzzy(2)` ser=C3=A1
>  llamada ``sys_xyzzy()``, pero incluya este punto de entrada con la macro
>  ``SYSCALL_DEFINEn()`` apropiada en vez de explicitamente. El 'n' indica =
el
>  numero de argumentos de la llamada de sistema, y la macro toma el nombre=
 de
> --=20
> 2.51.0
>=20

--=20
<https://www.alejandro-colomar.es>

--cf4tfyowvzztfkmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlkOaEACgkQ64mZXMKQ
wqmt/g/+MZH389P+HMS/v7JwiD8mzEFDc3gllF0TpZWXWUT9VptPGA3/8CID8DlZ
nCFU8AFOS6mAI8VxNEeyd/hY65/SgPd+5g3xR5qlLqqFwqsDzOJx14mSSmScnU9W
L8Cs9yTwT7ltAlQRokOT5NqenhWXE1pRjfEEbnfePhwSefdMPR63ttnyAVegDzhG
9n3XCPS2T6OK/G+ZxHej5z+qKPZ/aqzIVsFha4uVvH/CQFj/qexs6GHr51/EKx4o
2XGiGCquu/StFbo8zCtfF9hhGB8suDlV8La9MOeaKIMeerNYdCx3Bv1lnq8ll/+J
fgqogU6jjGRqh8TzQCjV/9Gk+ywD1Ug2sDiDeJt/c13PzgvY10kURND6BbeddakF
qGNFeBKBqZ8kfdrUi/C7ic3YaJLyi8DZEmVqbpbQKs6uenmbSJfp3hEkA4MbDRpL
gWMeWkkz48jI7aUyhTq++TNTtG2WgxulWdacJdpOVCcoV+qVk73fLvRkrx5pnkXc
obav1auo1CoJ4y6WnvCnu//NltfNpSuQDwQYuarXQ5//FpK5pR9Vh8gLc7wA1wdk
/XEybBTG9iRr8aM4LazNGc7R4TdVtR8mtC6qw6fHoyFI00QQw/M0fER8IlvJpVdf
iBP/4hO3sc+DVVwO3pTeos9bdI7sCFb32aQW0HFyqvSuyw/ssOY=
=0LR3
-----END PGP SIGNATURE-----

--cf4tfyowvzztfkmh--
