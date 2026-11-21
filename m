Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795299881;
	b=AxatmQT/4JGdeLbdVviNKNq81JvPDG+HZcqwKmTiWcdFgbD6KsCFAeJbtAS5RV8qeEiz
	 pJovABdz2IDChoQ71fX/UGIsRQCr01bSlm9qLMS/txcni/cWZGWNrJ1SSH0aNNdjz8m3p
	 zjuKf3Fs2iFLza/FR26aarcPaE1+hLDY1KUYbKxTMdiEsfnuU+M7Bwr5DLuFbNG7p18sk
	 JK3cqHSEP5xGT7Wd+Es75UWSysGvt1Vm8s1saOlJGAjI0GU6l9UN3g1r+5BSxLh06PcKE
	 QpEFSsnbiskprui60uz3G3IZ+66nmV97X+qF+XAHjordYsDtpNMMkNxgFOgxUF5Zi7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795299881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Hz3905wAXZE2z0xpo1pg4iMkZNUnir/n6DiACnoEPHk=;
	b=eemaOdyUB4LWI9s/bJALEraC1UJN1Xwsrb8XpF7xfH1ApSNozioCMZo9paM7xmWxaSt+
	 6rwqwGZEU3octrMYFMv60cmejpgW1Eg0ZONm5QngsQoEISqZlwlpC1EZVHUvR9+8PAO55
	 FC5/fCormAizXCRGx6lBVx8CcbQgkTl4LPyfKddHWoi7QvOdB+Bco3kF4RLhOkdT/QjWh
	 gpM82OspijMUS6tuacdbrhvedGmT0z3Dtr6xMGc8aWxd/R6miTiBgEl2bODWlO8rZcGPD
	 3Dwznd9E+k3iGwrZNv4nIaggGHlhveDxI97boyNVmJJ4QolzN1sBd8GKg/ifgAgVpyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iwlx/YiR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F6C606A320
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 22:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F6C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwlx/YiR
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-862b090e3c3so1167665a34.2
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 14:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795299880; cv=none;
        d=google.com; s=arc-20260327;
        b=VXGnWS4q0CfrI6UxgMtUanEWVhjkm0Adadc6kyNkDTN72++scQCNCCX2w+HJbd1s1F
         sOCAd2U5k58/bMahvAn25kOtqIacG5frhEkJo9vCYkvV2hp5V6+zjszF1CfEgXIxW0Sk
         DTFs4hpThA4OlQwyYgrBP0He/K7WkJz8zsPGsuPCORea5kNRHqfG6MDk+TeDnHo2L8vO
         uqcQzCH2hrSESdc8cLRouQXvNI80I2lGKciOAOWtdWORdDvH5ht/Q4bBt95Xv0extDdd
         akhFd+wcAF0l0sy+dMD+wMqVxnWLm4EgrcXYsO84l2Ef0LAnNvjtmZPiSXdD209nAjYG
         Mq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hz3905wAXZE2z0xpo1pg4iMkZNUnir/n6DiACnoEPHk=;
        fh=hqX/4CE/grXW1NGoWlNllvyDA3P4zEp5ggwleCXxe3o=;
        b=j+tLIdjfC6WtxVkwu8Bc+ibyeT7bZ8mIXGNPPlrEISc9QHjjK85g/5TP0EngASNxve
         nEHBHHdWLcPku4y2s1C3ydl62EtZ/YYtyJj8tf7fpSOwOfiDzxTXqHGB5eLcx+FmgRSh
         H/sVozSjWyoYwLi96TolsLLRNarQp5dqyMUcuaO2BmNGr66B1zB0JS9aVBb7SOUIYCvU
         y97qXkpmjhbFO1iQ43F2Y909uVNnxNBke00tMRh6xhEIhif/tZlqJ+lwO4JZpsxdpKR/
         MHOV6Zz+gE8qH/e8c+CVXQLq1SUzM27YKKV4yWeRUvPw1P3RRfZMsMH2SGtMlfUSa/kV
         BFzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795299880; x=1795904680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hz3905wAXZE2z0xpo1pg4iMkZNUnir/n6DiACnoEPHk=;
        b=iwlx/YiRPAdloZBmBL4iBicJ5qjH9cxWWijc/+M0drPUqUyZTbyNJy1fF4OT9IRKe0
         d9Fvg+W1Z+BJo2/wkQEHEhZ0wb8qMWAAy8SURPHAmuW7Prn8OoPQRpH3ZQiLVbvNExCd
         D3JvxE3k1EDmvNnPy3wgk9OYi3WVjmTK+ZzmZhRH6RkaeUQY1gkOX4gei720SqPrvqAo
         n3Gjyhgh5oofchX8sCPo9HlapCvfneWCMqgBmF7Um+ph8RD2dhm5mGt7D0B3wW8RFdAE
         64dXwJfl40o5/4PsehIkbg3hnsPU0ZkeLl/wU/ArSjwqoux4f7QoDcHtYxvFtHGHs8Xr
         Ym0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795299880; x=1795904680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hz3905wAXZE2z0xpo1pg4iMkZNUnir/n6DiACnoEPHk=;
        b=c3z0Zj3YcpQErJKNuLohGrFSiUG2N/byYFjCnKOa/fiaRdYy0GcPZ9AHGpy8404DfL
         fGH4AfKAxE6ISFNBUzLpeXZqu8uo4VjhuTS3MGPeA+g8No8V0AsxmVqdGALIcmgMcuWM
         TWYE4aMohGttTXzwVNpBHdj+129WpwguKl8BB7S4Iiq1Km7DA59DqkUWefUrCvG1rXnF
         p9RoUpwZrQOVwLNC+sTQi1S6MHqov95Df91l/QG9vwuilxU4hJgONLkoQKcfkqaZ8+U+
         ynu2BB3IVer6tu+PMyKzutRy8QwgNdarlaIncyT/l3Dj2nT6buFKzHl1SU4Zfw8K3J0a
         AmCw==
X-Forwarded-Encrypted: i=1; AL+hErGYMXrJp5+FFtNwFJW6nqXtSr+XcGjBEPpPiTTYPaIgxzpDZXvmVuExKd0/AcJNXP735wjJFnGgRzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UF0z/iZ0R600gC5vYr4y4TPWQTDy+pDwPjQ0MHmluu87fRArr
	4q6IxxQ960lcNF3PUZ9Zug0D2EhP5C65MljdPCVgcS449ebsTH62pAHM/ZMHao+NqrWia/WZrcC
	uwrVNQ8FL7cKiYCyLpP+78Raeu0ZPLLU=
X-Gm-Gg: AZFdTZfsK+7kQlKuc5gmsVa2XDJRFeNRXx3m7NtOA0S4HUqwSV9qz7Y9IoegJGAhF0r
	gSQVJXpWsgXfB63rMQgt68f6xaHPZdojB5RpF6kI/PtMi7xMOLYFUFlN8U2frZZ3u8IelueCrm2
	SfmcqIcFg6EVZPVgmPZCzjpWRB6iYdC7+Dchu0RDpNm/eEI2LFEC3+d6H5nldt+VKX5iAFz90Os
	qN3/SilPq3dl3BE0Gg5bqgM+5Z15YYLrHRfiP1OWsclrYzShqtxhE/GkP14Yp4mSAbf6QSGNThG
	iNPFMKqrsWa4yq0MnqHY7jr9aNZ9HEO0wg0pJNixGPkktmSj9uWNqodOpJg5c3WV/lx+oayh7Gu
	tM1fhIPwj4diqBCeE1HP4rtEmuqXxkC8rlXAg
X-Received: by 2002:a05:6830:2692:b0:862:eb1e:6a78 with SMTP id
 46e09a7af769-8631593a1b2mr8377193a34.7.1795299880305; Sat, 21 Nov 2026
 14:24:40 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-3-shijujose2008@gmail.com> <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
 <CAG4KcR+NOKHNzg6FN-oLLHgUxeitZHKXg9cN7dz24+Ap=RrwSA@mail.gmail.com>
 <20261110071729.GIavLFCfLKzPx8R0i0@fat_crate.local> <CAG4KcR+ikfQEBjCZiNJ1CUz=u3Gtbk_XDroA_GQqYpgO4Lo5Qw@mail.gmail.com>
 <20261121194030.GBawHzrrCNCMpfr7Gx@fat_crate.local> <CAG4KcRKhE1UXwrhscUdSpDJS8R0t7kWp8RXZm8j_9yXYJSQ2KQ@mail.gmail.com>
 <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local>
In-Reply-To: <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sat, 21 Nov 2026 22:24:28 +0000
X-Gm-Features: Aa3M54pmfzCjwgwOho9jx8HJwewKtlzAxxWUC8EhQd9hmHj0B3lyfXoGWgN4lh0
Message-ID: <CAG4KcRKzXNsvBWuuU2_aX5gO7u4vgKAK+bkrB2vgEFBGu3WJCA@mail.gmail.com>
Subject: Re: [PATCH v23 2/2] ras: mem: Add ACPI RAS2 memory driver
To: Borislav Petkov <bp@alien8.de>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 9:08=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Sat, Nov 21, 2026 at 07:53:54PM +0000, Shiju Jose wrote:
> > Please find the attached patch with the changes.
>
> Thanks, you missed a spot. I fixed it up:
>
> diff --git a/drivers/ras/ras2_mem.c b/drivers/ras/ras2_mem.c
> index 70f7f0b497ed..de5555d2e1b8 100644
> --- a/drivers/ras/ras2_mem.c
> +++ b/drivers/ras/ras2_mem.c
> @@ -117,10 +117,10 @@ static int ras2_get_demand_scrub_running(struct ras=
2_mem_ctx *ras2_ctx, bool *ru
>                 return 0;
>         }
>
> -       iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]=
);
> -       iowrite16(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
> -       iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
> -       iowrite64(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
> +       writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
> +       writew(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
> +       writeq(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
> +       writeq(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);

Thanks Boris for fixing this and verified by testing.

Thanks,
Shiju

>
>         ret =3D ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
>         if (ret) {
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
