Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3629B8E6
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 04:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767675409; cv=none; b=GPmqmBhYhta8j3BL/vr9hEkYb3MXry0/pjEKA58WuqDXi3pIBTVXrNxeM6D18Rhc7FFSS23RxAwJYLo8gkYUMh68qw0glUPKryMZCg2O73h78gvgmg7txz6T5FTddHoW5cgCjaQVfZYNiqLI0OdAOWNoH96f6KgZid+KH4jZylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767675409; c=relaxed/simple;
	bh=bPMuOyUg+pCFEpuN7CwHcwhs5rNIMbrQeGA0HQmyckk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDtCR6txs7WtwfkES/htzMGKy5+s7A3b47wUPitg9SoU/LiBcAGgruDA6HK0gPNDtv1qvPN6S4YeG/wkD8SwmjzCk4SFdAD3KGTMpKO1WzMbnVInMEQJ5I+MMw8w/kWZyeDJ2qgFX7nLd60lpIJl8Q/mpylY/SkGxFSr6LsI94M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=Ss7ckk8R; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="Ss7ckk8R"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-65d1bff2abaso359093eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 20:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767675406; x=1768280206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXCgyGXdfFw2jhIVzlU19gmITjYf/onAsSkhutvgS3M=;
        b=Ss7ckk8RVUlxwrFyuqelWPLqIIJuk2Uj4IEjWUM8dXuPOkWWm+lixB4Muz12tiyLpz
         mH4Vap32W+6b6n/STLcTzIjbzDLaNbuiPZCTCRxGrpbFOQJCn1ZCkEZ7UbWgPQhtnw8B
         oXpSumQ1Yeu/eSGxc5lYEgzDskB7hoTS0SMh5PbOGqICGpJP6+kmy0264h1lfjUv10B8
         qA62nRtRXUYA/ElO5yxDxVyWo2HgxNSGMFKoMiTrA9jAeoe5mjKnHjy41nFUnD1Df5/N
         aIdq/HaNUaJJ62hgsfOMcg+OWc5Xva5wuuO5pfe4/OfigXsOFHkOEuO8NTE04Fv8SXyG
         8QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675406; x=1768280206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXCgyGXdfFw2jhIVzlU19gmITjYf/onAsSkhutvgS3M=;
        b=kO4ns85kvbkQNYPuGJ/JD903PvJ8HQlPAkGlsN9plhr9gA6hGwdO/8meSuObO+qFKk
         rZuPnwzG7A+UgIAX5EtfBGWidWPgIfpW57MOuy1ijyDk58sBI8Prkb3agS39YlCVLOKs
         bvYxNNpzJVpWUwCBw4xLQgiJ1gSRRcVl4n8ss2ZnhXlvfTcWpvDGZJJsxiJQZaZ4bGWc
         lVGOsUYygyoKhUiY3FzxJG2Q5cFH4Ibhekaws79TmbPY0tR3xTko1Rnl1jap4U+xfX+l
         Z3iqUciQ0/2+k0oWGzUdfFgfUwC0EZJ3E+JMKZohzpQ4OS2okfXWPEe2/7SOWjLcxyY4
         D/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWfh9RHaoNt/2wXMYsTwHIXhgoRnIhylE9Sop+PAfi+m5NxUiifHWBq+p3pFgG+1ZDDxG8BTEJZtDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrrhcSUNKLKYlvXLjOJjw9GHQutrCxUOIGjcQNPmwqoR+/E9ok
	+eu3Yu435czZW59QH3SoIW2NbMc+Cjywpgc3hAx1zb2VeGAcYNgrAuCkaQzlmmaq4lO2YLGXXvj
	bqjSvqq620s9HzytEu4tQRC1d54LgPB+8aucvEsURXA==
X-Gm-Gg: AY/fxX7bJ/heiEXrK9F5vIWkdJIAJ2Rp2OFa/TrpfsXn6cgD203Ecm3j6KWDhk0Bx0w
	euOjNJPiCNOmjV2KpRLyUKuon/VV2jK/bf3Pro3EgLrYghoX0/Yd3T9r/q/qtC9ewNgxHb2wHyf
	KovezJ6t8RmZuvIU+auutGEZVbHOAhWx30CKn+mErBC+73FScqdzvVS2QRl3tEYMS+/VFwK6zkO
	PD2W4dVA8UeiEjBS1bmvFCh0JIu2pjOJXws0IlCe0tmtQ5se29jpwchmJwMLMcbge3ZvXvW8nI4
	vsordAqiiVh4YJ2ktDP4AEJtrIETpi6OUvS2GYUZgobXlw20xz3b1t3UDA==
X-Google-Smtp-Source: AGHT+IGq83xsWiBnk8S8Wan7SqZp6GnFrv0pdr0Nor1LjDGkvPMfuowdAk7rc0hTsmwGhsAqXr8Xk0551qnx4JMiq/Y=
X-Received: by 2002:a05:6820:2202:b0:65e:f37f:93a4 with SMTP id
 006d021491bc7-65f479d332fmr1135768eaf.8.1767675405972; Mon, 05 Jan 2026
 20:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020042904.32096-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042904.32096-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jan 2026 10:26:34 +0530
X-Gm-Features: AQt7F2rV_3WZCrB_VJwYGn79psT6Smtly97t591oPSUibomNxLFKeK19i9dMZfQ
Message-ID: <CAAhSdy3M8NMF0ojJdoSvtate6FRjS5hno2Wc5i=TeCF84yOK3Q@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] RISC-V: KVM: selftests: Add Zalasr extensions to
 get-reg-list test
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, atish.patra@linux.dev, 
	pbonzini@redhat.com, shuah@kernel.org, parri.andrea@gmail.com, 
	ajones@ventanamicro.com, brs@rivosinc.com, guoren@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 9:59=E2=80=AFAM Xu Lu <luxu.kernel@bytedance.com> w=
rote:
>
> The KVM RISC-V allows Zalasr extensions for Guest/VM so add these
> extensions to get-reg-list test.
>
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-6.20

Thanks,
Anup


> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/tes=
ting/selftests/kvm/riscv/get-reg-list.c
> index a0b7dabb50406..3020e37f621ba 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -65,6 +65,7 @@ bool filter_reg(__u64 reg)
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZAAMO:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZABHA:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZACAS:
> +       case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZALASR:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZALRSC:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZAWRS:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZBA:
> @@ -517,6 +518,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg=
_off)
>                 KVM_ISA_EXT_ARR(ZAAMO),
>                 KVM_ISA_EXT_ARR(ZABHA),
>                 KVM_ISA_EXT_ARR(ZACAS),
> +               KVM_ISA_EXT_ARR(ZALASR),
>                 KVM_ISA_EXT_ARR(ZALRSC),
>                 KVM_ISA_EXT_ARR(ZAWRS),
>                 KVM_ISA_EXT_ARR(ZBA),
> @@ -1112,6 +1114,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zalasr, ZALASR);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zalrsc, ZALRSC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
> @@ -1187,6 +1190,7 @@ struct vcpu_reg_list *vcpu_configs[] =3D {
>         &config_zabha,
>         &config_zacas,
>         &config_zalrsc,
> +       &config_zalasr,
>         &config_zawrs,
>         &config_zba,
>         &config_zbb,
> --
> 2.20.1
>
