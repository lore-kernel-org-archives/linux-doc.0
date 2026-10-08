Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D993D4129
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443912; cv=pass; b=MRygf8ioo1aodteESGvEwOXtyUduHt69XmOBG6i7UiM4nkDTRel47Syu1n90WN0Y1gtAdJ9gaUEQoEKJzh/dYBsz/u27YKnNuU2574Ioi39I59IGIK5hzQn8sGoqU0ZO2t1hf4IE72tq3UW5jVy8C9y5fM4C7E0fuS16VPIROm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443912; c=relaxed/simple;
	bh=mEfZs82VT+qdUvxddu4QZb3styi2rIzs8l6ABw4Qllo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yek9x4v17APW6MQu7ozQ5TNzCghrIFfotB+fADRKN4nvrzIslEEoi3HC0dEn9EDyURl0QwjiRo2gQ+RpPhIdTs1kJu/BO7Mx732HTah5eQyTzOKkI4njSSWzA6NxRz60e2WJwbbb/6CJvnzhbt3vyM1LxbJ489X+pdBtK5QQ1AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8r4URmw; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8r4URmw"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de2f213b7aso1141928eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 00:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791443909; cv=none;
        d=google.com; s=arc-20260327;
        b=MtsZgPWQLraiu0GluzThtMW/nfWSh61y9vO2hSdu1jGKKk3mytqk7XFwkQzgc3isWz
         RqggKCyFvNYe6phLT7dvuHMbNSka8IzfQURS2oNu2s/urtZm0wv06wj49dNKfjgN3Nfh
         K61xV9JI9z64jVF9gvOaimsZ8o2HOxUvQmTelljImRoXHAw8WXv5ebPlteOJU9IUDFSq
         Dw0RapzMPFFzkl46ayAVfnI7eLLjGzfc7haKjV5WXjAcDkzhKQ2zlnBR6zUY2Wcv/EhL
         4Bl4+UeCpVZhFSLLdW+9tjllMkuTp3Jc1GvZcT/t70eomHdWiELSzetIaJGJdEc4l5vg
         7I/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=70ywZ2AyEe7ncaX3K+b5VsGq7joUvo2qDjp4zFNieZQ=;
        fh=H4a9cwwsvWrS8X3bVd1p2+hfNR/5ETkoelWTgwj/7iA=;
        b=VT/plyKm25vmTghFTS4JoST46koxB0KW5YwwImKNWVGFoAawG/HgUSVevj0HGSEYcM
         DIOKsUiBCXGSQFkmM30mxVD+yafyeQd0cXpsu5sDMKm1aWXWTjV501/6rYp1rgAxBtzk
         dcMYsJgi21Rq+ULdFSXMqwnmEcd9H4hGUHxDN4iPKnxxD1psSw/0SEvNphrDeN7uv/qg
         xyjX2tSm4XEfHDuS3fXmQQOIyd/TxKzLvZrIlHGhv8PioEw2+3zfMyk4I8pd3oSgYIVp
         Fkt9MbJ3pAyjxBSuVlJxK9hpPqidEcaM4lquswM3i0kkgDkSKWEPjUqHgk4cHa5YaOcF
         4s8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791443909; x=1792048709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=70ywZ2AyEe7ncaX3K+b5VsGq7joUvo2qDjp4zFNieZQ=;
        b=l8r4URmwE6Pqf05rXr098yyUPpb0lPIsiCToQANmesWZw04HT6qBAsBWeE63M2Ftd2
         6ZnU0ZFm5fVVkw9PJ7zeU2S0ubWbK8a8dtxjz9anI4pN8sWr9WjYll7VIJdgWxUKRZcE
         CzYAE/e7oyx73INhV9UZr9cCz+4zHyK48ShE5TNmNK/eo7+ZH+lmBR7Yd0QMqwwf/RFJ
         Qp09hJzek5jHZZTgE0RIawPjlk1BAkm8EqCdTW5lVyJAwuOkwrNozXmI97OiNX98g4ja
         GI0Eait86lFnirEPX+RrTGL88K1JaT+amRpGPzg1DUNmHtsPURU7feScxkskttJ8LVpN
         AztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443909; x=1792048709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70ywZ2AyEe7ncaX3K+b5VsGq7joUvo2qDjp4zFNieZQ=;
        b=lbiLXOY3ROHOTX+/g+gTmBnNaN8+ij9l+H+cdomkLKJGDK6N6HRN2uZcrwwOqOR0fa
         8hJtuREH8PDQ/aFoHnHt7gPtQcwewnG5CHliAPOUPnUQzxK7O9Vm1UtVHnXxSvC1ftst
         NsVACgzO8qXLoStHQlpHsulBd0Jb+trcnnb2bQ8PI1vVm6ivUmFqvqWqdHjMx9kERce8
         nVh6rtVFrjH7vxIMxERqJwRuMN0sHrTcTZKPqlpeBpOp5lfhR7Joxv7OLl7kkesLhSAz
         CZsxovbqQM+ExWsHPVBotVGqMsbJWFRDmZkLCZ3F38KZCCJrs240LY1YTrEEzMDNhRJq
         HJyw==
X-Forwarded-Encrypted: i=1; AKwUvBwHVagymF5foLhfZl6tH4cE47E06EXk4zellSble6BJMI5sn9lY3zvQp8FiB0xloUB7egeLFmm1jk0=@vger.kernel.org
X-Gm-Message-State: AFuF++naCirjmLr1buJvzsqVZJgB368czdhKooRJxGv+Px3rmmFM7iR+
	Vi7qXPWARWt+eNF3s7W1ebaeeg5SM2J18/TwHXb8JtI041mUODPWq2RokAUEF+4IOQHy87uDYKP
	i9QQPi4yfPKfpLRH1eZvICnKDZRBJ60Y=
X-Gm-Gg: AYBFou3/1qmOP7v5fAanci9XEaIqwGc1x5PzD81vELWo2dAFaxpPJTQ6KezSso+HMWm
	daKVlENm68pgPQthLJ5RdJ49oz2M91wO2shfLnVGwGEpgk3KeYE7fhRvtblQ9RHa8SB7PlY8fLu
	kYh9JE55PLOPjrTXqh8IrC7FFCaeeQyGx/nEOc7BM68M+u6JD9Bf4YHXkB1bVkXMZQmvrpawek4
	EAOgx1UDJR3EwPnJU2eJuG8Bg/VQUfW8shiS/BQx8G16Qo1zBYKAs26C1wNvPgMwxc0G/WNt3tS
	Ur+W1cJrCZ7DrzCrtsvOa8JVwpFXJ6hwOAs0w5ACzrDQ85Pq57tafll1a0ZklyG62A==
X-Received: by 2002:a05:6820:618:b0:6e4:1587:d2b9 with SMTP id
 006d021491bc7-6e7aaecda5cmr4190773eaf.35.1791443909157; Thu, 08 Oct 2026
 00:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-2-shijujose2008@gmail.com> <20261005235021.GBasQ3vXTivT3NLbBq@fat_crate.local>
 <asU7svV8g2Hb5DZl@hu-ashoraj-lv.qualcomm.com> <20261008030603.GAascImzt4cv8Gz49p@fat_crate.local>
In-Reply-To: <20261008030603.GAascImzt4cv8Gz49p@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Thu, 8 Oct 2026 08:18:14 +0100
X-Gm-Features: AclHuK_Pa4PSN7Ovd8UjVYuZheIOrKSyX750Qa13rdRkYN_uBxTlt7ZeUcurB5c
Message-ID: <CAG4KcRLhN9=6xeT4qfqKLFdukiZLUc7akGcWwXJUU1-qrfxTUQ@mail.gmail.com>
Subject: Re: [PATCH v23 1/2] ACPI:RAS2: Add driver for the ACPI RAS2 feature table
To: Borislav Petkov <bp@alien8.de>
Cc: Ashok Raj <ashok.raj@oss.qualcomm.com>, rafael@kernel.org, 
	akpm@linux-foundation.org, rppt@kernel.org, dferguson@amperecomputing.com, 
	linux-edac@vger.kernel.org, linux-acpi@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, tony.luck@intel.com, lenb@kernel.org, 
	Yazen.Ghannam@amd.com, mchehab@kernel.org, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com, ashoraj@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Boris, Hi Ashok,

Thanks Ashok for reporting this issue.

I debug this. nows_txdone used to set before requesting the channel
until v16 and was changed in v17
following a review comment by claude.
Found this issue occurs when txdone_poll set and  setting nows_txdone
before requesting the channel, solved.
In my test setup,  I missed this issue, because txdone_irq was set in
pcc_mbox_probe()
with the acpi pcct flag set to ACPI_PCCT_DOORBELL by the firmware.

Thanks,
Shiju


On Thu, Oct 8, 2026 at 4:06=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Tue, Oct 06, 2026 at 11:19:30AM -0700, Ashok Raj wrote:
> > > +static int register_pcc_channel(struct ras2_mem_ctx *ras2_ctx, int p=
cc_id)
> > > +{
> > > +   struct pcc_mbox_chan *pcc_chan;
> > > +   struct ras2_sspcc *sspcc;
> > > +   int ret;
> > > +
> > > +   if (pcc_id < 0)
> > > +           return -EINVAL;
> > > +
> > > +   sspcc =3D sspcc_get(pcc_id);
> > > +   if (sspcc) {
> > > +           ras2_ctx->sspcc     =3D sspcc;
> > > +           ras2_ctx->comm_addr =3D sspcc->comm_addr;
> > > +           ras2_ctx->dev       =3D sspcc->pcc_chan->mchan->mbox->dev=
;
> > > +           ras2_ctx->pcc_lock  =3D &sspcc->pcc_lock;
> > > +
> > > +           return 0;
> > > +   }
> > > +
> > > +   sspcc =3D kzalloc(sizeof(*sspcc), GFP_KERNEL);
> > > +   if (!sspcc)
> > > +           return -ENOMEM;
> > > +
> >       __mbox_bind_client() reads knows_txdone at bind time to promote t=
he
> >       channel off MBOX_TXDONE_BY_POLL. It must be set before requesting=
 the
> >       channel, otherwise the channel stays on polling and mbox_client_t=
xdone()
> >       later hits the mailbox core's "Client can't run the TX ticker" gu=
ard.
> >
> >       sspcc->mbox_client.knows_txdone =3D true;
>
> Yah, I can see that happening but I don't have the hw to even poke at thi=
s.
>
> Shiju, what's up?
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
