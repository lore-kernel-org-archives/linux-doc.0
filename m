Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934589;
	b=b67dZcul3sMniyOe9cSECJroDs8IEPv5v7UmCEZVhrsrRvnsjBGKUv2i70emBucR0fu3
	 n4XWXv6KXKDZbrr1gPN0plnPt1EhjzJrqetEodrZLA//TvgnagqINDicynckQZDpevHJ/
	 9abMUIn2YTD/nVuElsQA/Ta1JfPsbsC++I1fZFgPWug7e+J2EPB/srxOfnDvqntyfHYxS
	 NEo4PrVOpRfpEkJyAHBesvMpeD9b4kleRTfOpy7qyKrIQmcCgBTV1NFp7bIWx7b2MP2xH
	 /1taSyHXDKQKe/R1+0olOo1gxH1uqGS9lJAoEA/LRvTuKp1RgLsdutPkrMXBLd5cq9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X6vbMJkh4xPzuEcl9o4UTbdDi9m9a6y5s+AAwaTb/VE=;
	b=nNy/1tDxuWz0VAP48nCpr555GstLJi/ODBzEHeMokPqMHilnYvB09fQuEFS7qSs8JSBW
	 3PfcD+b6J0Rv5nJncMDbZL9F7ylhUHkVP3WNgEmzyGWmn580UFrinRSZHs4BLWWSef+3Y
	 aOtuCaP8T1B0P+Ijp0JIuutaFoV+JP5XKkTYafy205+HWfT/DSCIYIkM3A1sqP8uhrvsH
	 hs5OUX4CFE0yioEND8GHOL/Upx08qHuet/PEOtEQi+ADzb3fkbqd+ruAuJeT+PL79SdSD
	 8d39S7DHNoW6wkWSXUvzLnUShP/Z1iGPsF/GHF4N+RH+hLRnDxy6FZOievX/ug5OmfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jPKsLWh1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B111606A31E
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 13:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B111606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jPKsLWh1
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b55859245so13209176d6.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 06:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934587; cv=none;
        d=google.com; s=arc-20260327;
        b=FUrgvKMKMCC4tbQWHGo7DohSOtRpz3A3ZidkuVD9bGA4Q6eD2h4HybvXmhwkwZxxld
         Wood1PS1ReMAEWStoThKOphpZoImbjkbQPKCEtH0UxZKomdT1CX+v7KYubYspqTy78Xn
         81YsnXH+z3bt/qqoiVTDtmmlQiny684Q92V1ztu/y2+YLkNpC1YBEdhc6Qnh8ko8KM7Y
         NbODZxr2Yp0/VBQeDQTX+B4lMCdEapf1J4sv6+GswYUwaBKg/I7PlJrbymHjC0f9Z9jT
         SXid++Zn4XJa8mLgtbdurCwMBRrAZq1AW6ixc3rjjBIo8T014q6K4hd+siPjPVIUIBHl
         zMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X6vbMJkh4xPzuEcl9o4UTbdDi9m9a6y5s+AAwaTb/VE=;
        fh=gEBL4+l6O7TU0LE4Rcgy3VKQLQlqi6rEPHxp86+YdFs=;
        b=Yviq4zVu4fWWHFVbfxwf7LeEnwhwZTig7R93JdI7uoYeDvAwl5ghHaEiJ3e4hKLFKY
         0fQ6aF6uIvCp0vISXv5seUuVP5VzvKLzWTTrvhcNIdtlyi/X23lBdPaOThpm2IGZiJ+X
         Iuboo52SXx2XyZ2Yly+EYt9UPmoIa9xFSBpjQoDP2pXxuaXsb0QvGWu3Y5fJveqqIhMN
         6zLurLWkst1eMEh4VYhIihzPpet/MKX69Rq7p88dFkr81mX6HGjW3iFcxBNuf25P8NVx
         GWyP3XE2dwPyOporlGdQ3w+o+NaYcp39DWdqSxLHHQ1CyWEhEoXfbiOm7wygeQqL9gOS
         O94w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934587; x=1793539387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6vbMJkh4xPzuEcl9o4UTbdDi9m9a6y5s+AAwaTb/VE=;
        b=jPKsLWh1wQCx+uFkDMaGoQAlzMDmG0XPhV4wljunZLrs09EJyBKRKiDA58n7EuJ/4V
         je2zRLXEtjn1PhsqD28scCYrTMNv37rUYlCCKHjmP+gT4bsRCiOOOEyB14bQkkJ+OgdW
         RADNOn1ivHmCwSQ1sGI/l7e6xuwW/Gpdm2UHqe2TOEQ8on+feWUGlDCprsBXttntqwcv
         ALq9IW+2izLruIIjjsX2CbLCXSzafBAHmkmV7kAQhcM6h2DfnpxJw5CFdp10njk3vDHb
         mfxKOsQgrAX3CcjwG/Joa2GQFssuEbcS2WIHTr3cvhdk35eCu7wCsMeMNYb3UiA0FwXa
         oHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934587; x=1793539387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6vbMJkh4xPzuEcl9o4UTbdDi9m9a6y5s+AAwaTb/VE=;
        b=EHjDpSy5RJ2mPTBReZP0/TA7Vu4CiqTdXOlSN4fOP0Yaqixp1JKGsplsbufnyvWHUR
         n2tH//dKAfbTXJSpze9MweX9YLE6EEWG+C45Gz/7mS2C2VVRtvXOI/1NkCs8amnnQtZo
         QAFVRt2SAL+vdqbzCC/lKdnIxYvnDILuLLc1xbWlaTzG/4k1UGu7t/i2+c5VMXOxjdAB
         f4GJKSIE97V1pPDUaaGnUkbLhZqAzfOf+6R/ep53SACfV6JH7smKnkzhXTYfpYOpxS9w
         lPyIenyrzpprA4bQp1zpxHnkzIn6PeqokCFt9fOjoacv1xitrx+Dct7LgCKleiuWQtIP
         urjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAKfMmF0ZjwI1WFxRrKrCjKpI3MVsfl5ZuVpwV7DVIGDlaCMYu6iKMtRnOogz1DzQKxePmRBoBQB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxLAbfymmP0nLOPrqE888eOzHBlsCdlvte59V0xSm0FcwZ8kDq
	0LPaIgAEZ1WlQlcrr6cFSVf1lXXtX+C9KARoQfwRAqUuWW1Pbptw4XpzTf6RQLyNDJGzpZnaeR/
	fE82VBl83aLCW9LZYUkuaGE55laOGeAg=
X-Gm-Gg: AYBFou2mZ5LAVE45E4Xk1NZ6v5pRoYb1vCpizQp3NvGHxSnlRln+2Vv2czmjL9upUfh
	5IqRPy3w6bYwNMqu1Gm+4Nxw34Xgc/j+1BCq5bXGvW5Q0O1NN4qZYRrppSAQ6KuJm/ED67zPhCO
	J52/o61XMjG6Di9qb/wIWeqeYFIwt/896dSDUENaUMRiOhNhyfrWM5A314hCyKOPkWBAqoIEdVg
	MZRPCj+s4oudvXHV+K3zt5n1dzxLURzcqlgyb489wOW18ETkteLVM/5Usvw1sy9cRgpWc7pu+Jl
	c4dM/kus7EEtIYfoOtlnpO8OeMfyuqrssPERz1YTs63unDlW1hW8DqKlvuzb8jDUhUfrZeqz84F
	LDk8s8eY71ITK1uVh5Fk3Xm6EIh3OdLWNtTH4accvjx640L+9E/cm1Tnv8ofR310h+lQ1JeT0EU
	slBN6Py0USXr1oG8ty/fV9nnMqyVTyD6Lx/95e7QgtzEQMCgfvpuuqDAaDdQ8bbkDMyVApuU9x
X-Received: by 2002:a05:6214:53c3:b0:91b:b26a:9791 with SMTP id
 6a1803df08f44-91c48f150camr69861666d6.56.1792934587195; Sun, 25 Oct 2026
 06:23:07 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022013432.2638010-1-gr3yf0x87@skyn3tlab.com> <20261022014811.2803450-1-gr3yf0x87@skyn3tlab.com>
In-Reply-To: <20261022014811.2803450-1-gr3yf0x87@skyn3tlab.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:22:55 -0300
X-Gm-Features: AclHuK9yewKN0-UZdNUV7XZr57BksERgCEoIcvborAR-JnzTIy1oVpZl5H1ou6Q
Message-ID: <CAMAsx6dgDhfNvw+3NWD1pBxyJfHTa7rUD+-9Y4L5K2FpDXJS6A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: changes.rst: set the pahole minimum back to 1.22
To: gr3yf0x87@skyn3tlab.com
Cc: corbet@lwn.net, federico.vaga@vaga.pv.it, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, ihor.solodrai@linux.dev, eddyz87@gmail.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026, Mark Severson wrote:
> Set the table back to 1.22, in the English document and in the Italian
> translation, which carries the same table, and remove the Italian
> translation's copy of the paragraph that the English document no longer
> has.

Hi Mark,

I went through v2 against the tree (docs-next at f857ff5bf):

- In Documentation/process/changes.rst the table says pahole 1.26,
while the text below it and lib/Kconfig.debug (DEBUG_INFO_BTF
depends on PAHOLE_VERSION >=3D 122) say 1.22, so the table is the odd
one out.
- tools/bpf/resolve_btfids/main.c now rewrites the prototype of
KF_IMPLICIT_ARGS kfuncs itself, which is consistent with the
explanation in the changelog for dropping the 1.26 requirement.
- The English document has no KF_IMPLICIT_ARGS paragraph any more, so
removing the Italian copy brings it_IT back in line with it.
- You mention that htmldocs was not run, so I built
SPHINXDIRS=3Dprocess and SPHINXDIRS=3Dtranslations/it_IT with the patch
applied: no new warnings compared to the unpatched tree. The
undefined-label warnings that show up in these two files also show
up without the patch in partial builds.

One process remark, which I leave to Jon: "Assisted-by:" is not a tag
that Documentation/process/ describes in docs-next, and checkpatch
flags it. I could not find the "Attribution" section of
coding-assistants.rst that the note mentions in this tree; it may be in
another one.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel


Em qua., 21 de out. de 2026 =C3=A0s 22:48, Mark Severson
<gr3yf0x87@skyn3tlab.com> escreveu:
>
> Commit fd5425b67355 ("docs, resolve_btfids: Document kfunc BTF
> annotation emission") removed the paragraph saying that kfuncs annotated
> with KF_IMPLICIT_ARGS need pahole v1.26, because resolve_btfids now
> emits the kfunc BTF annotations that pahole used to produce. That
> paragraph was the reason the requirements table lists pahole 1.26, and
> the table was left unchanged. The text below the table and
> lib/Kconfig.debug (DEBUG_INFO_BTF depends on PAHOLE_VERSION >=3D 122)
> both still say 1.22.
>
> Set the table back to 1.22, in the English document and in the Italian
> translation, which carries the same table, and remove the Italian
> translation's copy of the paragraph that the English document no longer
> has.
>
> Checked by building linux-next 20261021 with pahole v1.25 and
> CONFIG_DEBUG_INFO_BTF=3Dy: in the vmlinux BTF,
> bpf_task_work_schedule_signal has four arguments and the bpf_kfunc decl
> tag, and bpf_task_work_schedule_signal_impl keeps the
> struct bpf_prog_aux * argument, as Documentation/bpf/kfuncs.rst
> describes for KF_IMPLICIT_ARGS.
>
> Fixes: fd5425b67355 ("docs, resolve_btfids: Document kfunc BTF annotation=
 emission")
> Assisted-by: Claude
> Signed-off-by: Mark Severson <gr3yf0x87@skyn3tlab.com>
> ---
> v2:
> - Also remove the Italian translation's copy of the KF_IMPLICIT_ARGS /
>   pahole 1.26 paragraph, which fd5425b67355 removed from the English
>   document only; v1 left the Italian text contradicting its own table.
>   Found by the Sashiko review of v1.
> v1: https://lore.kernel.org/all/20261022013432.2638010-1-gr3yf0x87@skyn3t=
lab.com/
>
> checkpatch reports the Assisted-by tag as non-standard; it follows the
> Attribution section of Documentation/process/coding-assistants.rst as
> published on docs.kernel.org. Not run: make htmldocs; the change keeps
> the table's column widths and removes a whole paragraph.
>
>  Documentation/process/changes.rst                    | 2 +-
>  Documentation/translations/it_IT/process/changes.rst | 8 +-------
>  2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/ch=
anges.rst
> index 28f2ca633..13093c5c2 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -53,7 +53,7 @@ mcelog                 0.6              mcelog --versio=
n
>  mkimage (optional)     2017.01          mkimage --version
>  nfs-utils              1.0.5            showmount --version
>  openssl & libcrypto    1.0.0            openssl version
> -pahole                 1.26             pahole --version
> +pahole                 1.22             pahole --version
>  pcmciautils            004              pccardctl -V
>  pigz (optional)        2.4              pigz --version
>  PPP                    2.4.0            pppd --version
> diff --git a/Documentation/translations/it_IT/process/changes.rst b/Docum=
entation/translations/it_IT/process/changes.rst
> index 0be1292a8..b4accd428 100644
> --- a/Documentation/translations/it_IT/process/changes.rst
> +++ b/Documentation/translations/it_IT/process/changes.rst
> @@ -57,7 +57,7 @@ mcelog                 0.6              mcelog --versio=
n
>  mkimage (opzionale)    2017.01          mkimage --version
>  nfs-utils              1.0.5            showmount --version
>  openssl & libcrypto    1.0.0            openssl version
> -pahole                 1.26             pahole --version
> +pahole                 1.22             pahole --version
>  pcmciautils            004              pccardctl -V
>  PPP                    2.4.0            pppd --version
>  procps                 3.2.0            ps --version
> @@ -149,12 +149,6 @@ Dalla versione 5.2, quando viene impostato CONFIG_DE=
BUG_INFO_BTF, il sistema di
>  compilazione genera BTF (BPF Type Format) a partire da DWARF per vmlinux=
. Pi=C3=B9
>  tardi anche per i moduli. Questo richiede pahole v1.22 o successivo.
>
> -Dalla versione 7.0, le kfunc annotate con KF_IMPLICIT_ARGS richiedono pa=
hole
> -v1.26 o successivo. Senza questa versione, tali kfunc avranno prototipi =
BTF
> -errati in vmlinux, causando il fallimento del caricamento dei programmi =
BPF con
> -l'errore "func_proto incompatible with vmlinux". Molte kfunc in sched_ex=
t sono
> -interessate da questo problema.
> -
>  A seconda della distribuzione, lo si pu=C3=B2 trovare nei pacchetti 'dwa=
rves' o
>  'pahole'. Oppure lo si pu=C3=B2 trovare qui: https://fedorapeople.org/~a=
cme/dwarves/.
>
> --
> 2.43.0
>
>
