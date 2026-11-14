Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794683425;
	b=fz/zPBlQc2oLQFzkoVu50wFe/Pf4GtIGRWR+EU0vv8m58DURBfhMTTNTvVpklgR6wC2/
	 Ylh7gRha/0QhQZE2AKO5E5UfM7Ny/tAL8z+EwYz6+RmVtrE2AgLckmZHRKoXo2u4PLOp6
	 X18XtUFesjGb+MzLDSfMXCjoqjYsFUIu/KLuOisLOCcnCiJ9eQcm/f2CJ+A+bXU+FBCrx
	 4sDa+w53pNFXZLL5oMo7YKREoVXXJZX6Tc4kcoQ/sOdMYwFk55e+kgXipaCzknUhXiBaL
	 qUN8EL3pHUr4IIMQeEs6grNpUQaBNJjkbWucqCwLQd2DOB4pOM6X9z9wc4sauKEqRUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DhlxCKd+KZzJqKapHW0ISZ0Xg6L7zDgMd5SLbJ3iQ0k=;
	b=L93HGUhULvJuLf2t9wngFPevK5fbuIDHlBKYZeopgLTCp8pVFZleQpxOfYzizcIMOmEH
	 vjWJH2w5n2Tg00i7wdnDstlcHsgAHvBk4uFey6ym3LCTrBmH6Tb7eu38LrVZ35KYc6qmt
	 7EUrIVtGdQT3YMY3oRta1LpqIWb4D1qoH9BDpp0T1JJ3tm+YK52PfEz6VWjD+fH9O0Jga
	 JM79TSXaVDqdHP1r2/IlDaauiCOlAcKUXG+GhpGQcfMFrUbnWYpnLX4MA7z5uvCmR2OFG
	 9adRJe8Okwc94lka2Xp361MA8+xJAVU/Ah+sVEtXf/ThVmamPcM5vXT+VDwUlQtPGcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFzHaxc1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70584606A329
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70584606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFzHaxc1
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-945e6d9ceeaso253688985a.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 11:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794683424; cv=none;
        d=google.com; s=arc-20260327;
        b=MMvXBst80l5NPa7kUEaf7tsf+QHgefmLlKSd55rf83qvQ3aJnCdLCyGNRvxVkkAwyx
         p7yuN62vC+dn9extxe48kraerFbf5ggnqDWkWLvJ6gQbVpjUQq5Tj/gBx7MEMSpf6os4
         4qzD1UaiN5Koo2s2DmYqrykRy9EafkJMJD99ejCJKrns3r6jxLMCovm4bD/aNLKgUiFn
         aZXfNghQkrXU1iKoY+oe6tsxyq2eCYqB4TVdeQRVM6EIXVPFaiqWm2u5D0UjAphch0Pr
         pELj3yRLpgXNhf/EkERhHKMD7xaFUYbXhdVLlVrzYtaAU0AkWgva1qJwX/zgoY2joYru
         bNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhlxCKd+KZzJqKapHW0ISZ0Xg6L7zDgMd5SLbJ3iQ0k=;
        fh=uXppkrsNoGh8vwRtTRXkQVe9dsLOVoKd2S9QgrXPpHU=;
        b=eV2WieDcHuDam0RzbJ/VbkSKWIU15Ep48dU+TYPSsPiQyQvM91zlyAA1acIGyv9tuN
         stFZeM6Q4p3hRXBCPsozbTbkOjQuGrqZynpqMDnnBR7ZHJkj3Inys4EWsdXiA41SXCVq
         0JAxZiUy5ozypTRf5IlmxoRpr0rzFxqP7TwcI3tkltLCD+LP2qjMEIJK5KhAlgDNhL5w
         Wwn+OSVKCNZs9NxW6OhkURFc/uPGeF6nItbhDEoWAW0wgeD/a9MkSNyVOgnuPjVylH7j
         ViY2TH4gYqoUWRpSQJuPjJe299iM+zJ1vXF2l8MqvQh32ZnYz2HweQedMmCpq1JFV3O5
         FgVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683424; x=1795288224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DhlxCKd+KZzJqKapHW0ISZ0Xg6L7zDgMd5SLbJ3iQ0k=;
        b=gFzHaxc1HJV5zpNrG7qJ+Zk5zMBAxMSLMXq0F6iwaLD5xa8L0+kEcljLnIGuinnG97
         SDMcPMd1UgE2QDTzJOIu8t3Ye6jm431mRyRiq58COoabFXjvhtNsOofEpO7BDTnv27b3
         U7P0iPfTAQpxAm6L+QhqjfFuatJOq1vcvFrpQOVCVVJTNg67jkAxbuFE9nrYcvDlTAZi
         wYH67Q6yeRSz4UTrpiwDKj59ZzrPAgyYZ0HFp11xj/tw2o7N/1adsA+Lz3wxe2Q53vql
         CP0OU4T7iiX3zz38B4dgbdee6yP4dSo/LpV+DS7zjEvbyT8E3D6UoXOyhzaQ9V6uV4SI
         EsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683424; x=1795288224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhlxCKd+KZzJqKapHW0ISZ0Xg6L7zDgMd5SLbJ3iQ0k=;
        b=PPU1rBwloEoOXsqBCtf+uY5BuCQ5aAAKRyML6BXPE+VFG+QcWB4K3ByUpQSbqecf18
         zoxwIeReZ9/NgaOXIMc6hF/zH9s8UP6isbZ8YdbXdJ8iOnw8oATXerS9ySUyPSMX08Lv
         2mYjg7RBWwU/fTD3cIsK+jT7gY30hy3RljCYsi4rZE1R1sOsPH81vxkBigzMm/uLllwE
         4YX8pwfDdrocn/pdM/Ltl29GHeAEQotiDehYd2BvZG2Gial08X3i2qDvt3GNrtuif+Lr
         la+KF1bv4/h71dXAqRkE2E2/kuK9yV0TSFv683q8Vo/rhRq+6lwu/0C2aAcmbjdW+2uV
         kgTw==
X-Forwarded-Encrypted: i=1; AL+hErExGuk9LaERjYWFRVvGaXhStlxPAB2iUWc8v0oHxX3ft5oCdKd4M+tizQTlGYc8bw9W8cywksnjT8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oPr3AnimOibK4fNNDMh/JTrP2BHt067Zs+ChCvlk7KADQJ0jE
	wXmEq7eh/qi6Avps9uHz3rnZBzGpOy5rZ0xiOZwYtzRVbb7VNbyFCP75+ImXMEHh98GLJaMSrCR
	zDDoBDMCGZR78/l0VKbgakqly1QuebTA=
X-Gm-Gg: AYBFou11I72IQ4FlcesC3yEPlZ+h45f1pKd55r/kyCHpP+p2JHLP3GRZsUlQTxPXyGx
	cISEjQS8doU3IxSKGj8YoECvGDT5gJFLILHBsuBaurbuL9A6wMGmut7Y9+HdIqbHO+GmYuvVFxB
	l/0Mw5vHkVaAwpQVWPOwYjT9zqb6U/Xw0Uoszc/I8ostuNRXxrzhGmXiVpaGvPiJ6LY4qbhCpAc
	0GefgW9EKGcVvEM/LQ90N5Bz+rtgx5OsJWKuYEEZKwnEfU55o63u3oW9tM2g9KXqfZ6LSNNemYR
	xonaGkR5zqjt0BDfCqpX5lCN6e/eehGyl9dGyoUoA0acQMmCt0J/0PeeYOSvSpIWApmCtS4l11r
	p0pdpXLWIPosxBewvbI88alGYQZnJGtYNL+D96dYfafY8NilKtAZwwoO82xpJyXN0aTh1a3ctot
	GawsoTEQAd+iFudOUCFPpRpO2BRMarJbDV4pRcCPS6JN1WbHP1foW3FTaaCPZSiAb44neeZT6MD
	Gfu9Q7AK26VT+KVRaeS9whXAkmeIv35WvmKfhoPh8yySAqNmGSVLg==
X-Received: by 2002:a05:620a:aa11:b0:949:5db7:b32a with SMTP id
 af79cd13be357-9495db7b519mr625571085a.43.1794683424352; Sat, 14 Nov 2026
 11:10:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109032455.33944-1-giovannamccds@gmail.com>
In-Reply-To: <20261109032455.33944-1-giovannamccds@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 14 Nov 2026 16:10:13 -0300
X-Gm-Features: AclHuK_svhzBL_72bU-7E0tguzC375yULVehsGbkjU9zs2ybvjMf81kxBuedYa0
Message-ID: <CAMAsx6fc4B6TY3otpkiQ4gUDT4vzz14jDp1nj+5vpao2zsb_8A@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate gdb-kernel-debugging
To: giovannamccds@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giovanna,

> +Configura=C3=A7=C3=B5es:
> +--------------

The original heading is "Setup"; please drop the stray colon.

> +- Crie uma m=C3=A1quina virtual Linux para QEMU/KVM (veja http://www.lin=
ux-kvm.org
> + ttp://www.qemu.org para mais detalhes). Para desenvolvimento cruzado,

The "e" ("and") between the two URLs is missing.

> +- Instale esse kernel no sistema convidado e desative o KASLR se
> + necess=C3=A1rio, adicionando =E2=80=9Cnokaslr=E2=80=9D =C3=A0 linha de =
comando do kernel. Como
> + alternativa, o QEMU permite inicializar o kernel diretamente
> + usando -kernel, -append, -initrd troca de comando de linha.

Please use straight quotes for "nokaslr", as in the rest of the file.
The last sentence is garbled; something like "usando as op=C3=A7=C3=B5es de
linha de comando -kernel, -append e -initrd" would be better.

> + voc=C3=AA deve construir(Build) o kernel com CONFIG_RANDOMIZE_BASE
> +- Construa (Build) o kernel com CONFIG_GDB_SCRIPTS habilitado, mas deixe

Drop the English "(Build)" and fix the spacing ("construir(Build)",
"gdb(necess=C3=A1rio").

> +- Construa os scripts gdb(necess=C3=A1rio no kernel v5.1 ou superior)
> +
> + - Crie scripts_gdb

The command is lost and the "::" literal block is gone, so this
renders as an indented quote instead of code. It should be something
like:

- Construa os scripts gdb (necess=C3=A1rio em kernels v5.1 e superiores)::

make scripts_gdb

> +- Inicie a gdb: gdb vmlinux
> +
> + Observa=C3=A7=C3=A3o: algumas distribui=C3=A7=C3=B5es podem restringir =
o carregamento
> + [...]
> + Para ~/.gdbinit. Veja gdb help para mais detalhes.

"Inicie a gdb" should be "Inicie o gdb". The "Observa=C3=A7=C3=A3o" block i=
s
indented 4 spaces instead of 2 (as in the original), so it renders as
a nested block quote. Also "Para ~/.gdbinit" should be "para".

> +Exemplos de uso do Linux-provided gdb helpers
> +----------------------------------------------

Please translate "Linux-provided gdb helpers".

> +- Examinar os campos da estrutura da tarefa atual (compat=C3=ADvel apena=
s com
> + x86 e arm64)::
> +
> + (gdb) p $lx_per_cpu(runqueues).nr_running

The "$lx_current().pid" / "$lx_current().comm" example was dropped,
and the $lx_per_cpu commands ended up under this item. The original
has two separate items: this one (with the $lx_current example) and
"Make use of the per-cpu function for the current or a specified CPU"
(with the $lx_per_cpu example). Both are needed.

> +- Explore os hrtimers usando o auxiliar `container_of`::

> + vari=C3=A1vel `task_struct`

The original has no backticks around container_of or task_struct.

> + fun=C3=A7=C3=A3o lx_current -- Voltar =C3=A0 tarefa atual
> + fun=C3=A7=C3=A3o lx_module -- Encontrar o m=C3=B3dulo pelo nome e retor=
nar a vari=C3=A1vel
> + do m=C3=B3dulo

This is gdb output, which is printed in English; "function" must not
be translated. The original also keeps one command per line, without
wrapping.

> + Guia de depura=C3=A7=C3=A3o do kernel com gdb <gdb-kernel-debugging>

The other toctree entries in index.rst have no custom title. Please
keep the same style (plain "gdb-kernel-debugging") or explain why this
one differs.
Also, the patch no longer applies on current docs-next: index.rst now
has a toctree with userspace_debugging_guide. Please rebase before
sending v2.

Daniel
