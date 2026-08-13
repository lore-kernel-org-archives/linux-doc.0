Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58573495501
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 18:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647301; cv=pass; b=gVt1mUL+qG9LsYEG/28x7XeYPa2nONCtp6QRmCcImCcXJzR1oohASl0F/7rjB4fBl3J9km86OrGRRQSS0ukk+2EZ9SsEtSJo1vVXqZNogny48UQElh60RRjMQid12Ma7gHXVxyyOb/n8Vvsy/wZEAqgxW0yMCVxRxRKeCcn0b7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647301; c=relaxed/simple;
	bh=MZMk5amhVvwpxgU22Jr2gG0SimDKHn4o3AJnpzUIRys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSu3iCjBHkNU8Z5TtW9r7bcKTQ11CAMh0da4OwfbN3QXBLkcZUPELpqEuLrUm6RCSV5UrFPw94LNaOFsQ4WTeeRGljkyuNWwpUd1P8gHcEKADrKHIJle6PoG1Ju9BAmwepodCSuxPlBAlyihwBKJ8+bC4ZKrgV7ig3OWd3qi/oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb662xZ+; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb662xZ+"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4960fb63c75so87116b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 11:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786647299; cv=none;
        d=google.com; s=arc-20260327;
        b=CacvB+eg4OU30YPCKb+lIjE7nuAjuYKR0dwtYG3hEnzciYENagW4jNkqGY3r5pF36o
         DlZ4oLxrHG5hmZUNfLTVyo32/rrX1gn7L0ZB6qJLG1bbxW22jRP+im2c0ZrdoKfNM3JR
         sReIn4elg790GLkOyyH7RDKe5jbcbJdG7+bU84kicjb5vLjZFxWIczz1/qnwZcApLCVO
         3DF/glofeYWNK+1oBUocVJgeQguOBuP2OPuVQBHSPs6MsxoTZ7g+WA88v6KYZ5ciNY2R
         JTOiwwa8M8LOcIxyHckI9ZezDEV9/EqPMAenYn4sCWz4xG6K7wYkD+PckKLpqww+v3hK
         H2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4D8xAVPVQumphtAB0QLf5r82YP3dFNVcG1VBTYgExPI=;
        fh=s/3dUL56baq01R5SZ84FdfIuQc2skTmXKn70xihxbBA=;
        b=M9gAt6oDqSADSVetcS6mjMw0BOBCxwJaMGGE/Mja5FRFs1zl/cs02iVL2zkDMLXpnZ
         SY9A7BY4cLA7n87xjGOcXy4mSCkxX1OXChQTtprpLnfWPh3SvmiUpd7xA8NFIUOt/ing
         8QNYWpsno/UYqQhyutbjgK4cioHnl7WjawojpXLzvGdYVu1VEMxkOuNQnpoDxy53yihF
         pKb2NIieZdydr3NT6D6WyWedhwwjfNRXIita5wk/7qYu9ugcdJvGWHgGD9aI6b6fSaYh
         duXoB4Ls5MM0eD58nCf1F/Vpe0huFGsTcXsueYdoVKBcheqYO+lRqMhZz+hEN3LZ+IkO
         AD9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647299; x=1787252099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4D8xAVPVQumphtAB0QLf5r82YP3dFNVcG1VBTYgExPI=;
        b=Hb662xZ+DWuhLhaaGHLkKwhvVQkAyjuu/PDNAfrIObBmSVhXeN5Gd7WV9Tj/Da6tlP
         HhTkaB42si8PfQUj565U6maiY4Ko7hf50VQAEH9QvZ0mXUFnQji/vjRcGiHhBxqlY/IC
         ydGjxxG4oJDa+kyPJP0mp5624mcrPpInWRn6HBrqkCBg2c9VhFWICjbbC6YQC9cdRgX5
         akmXV2iIdZysTz50F5YhtEnW2ll/mTW6wH5PZlpUbw2BYe4z8GqBp8jMH5pjyyVhLQ8j
         HjKaonWdjXjGgwdW0jzBpo+HQnSuSC9Hs5Jxak29ZbQfmFCH1mMWyFjxnFANMh2V6+8n
         ZmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647299; x=1787252099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4D8xAVPVQumphtAB0QLf5r82YP3dFNVcG1VBTYgExPI=;
        b=bTPJJWU7HaAjOFr7bDYQ2P70TkEl3j7+BXcm3OlTD5nl1LsafC8N5pbOuVReA45FI8
         kg6SL/zq8iuAlaKO0Y/kdYfL0EeIwa3osaipR7oNLMTRcd4WZzNtIApClbzVQ6s7N7E+
         3A9DVyfVsFqXnHotFGfpt35I1MdRdMpOaI0qYLs1MTmRuoE/BLvKbbDBLYOu8G23dFp5
         /8HN0JcGA2952dwC8WkGu2qTaxBN4atvtPGQ80PFgT0pDPUVrWQi5/fyM/Mv+h0pLjsR
         VT59BX8hrXodY8vL30lv4AGMeS1C6Q2/iNNA8ZyM35vEmimqb1UV7b9d1s8Rf2p1uSjV
         mquA==
X-Forwarded-Encrypted: i=1; AHgh+RquFqEq9GGA4xqZPxXNEhHoRh6NXERSYAdOWoVObFHTbgTqM7VrMCRvYGMGfdYl3Vzf8O78Ajx1Kjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwcXTw6mCZgn/5iHCbe4AULz1h0SlGQeDW+wnATxxaA/jONqJJ
	CEgho7t/Kg5JotjYj5ER/d5WPiy1gCxfoSDrEF8tH89/at9HmVJPe+99wg8xjBK8wTZ32rAzdN8
	HzAdanngPTEL+SdRxzoSg4F30X0bVfnk=
X-Gm-Gg: AR+sD11YMd5S/2c4hS0cthckE4ZfEMBabMTnl4hr8Naot3VAAtk/lnIIym3T5xcYcb3
	zRX/sMXTVQ/HaXhVkWDEN5qA41lbrK9IlWFKE8cWxkzyqofNULd24/B/FZrXc5tZmdrKu/UFYre
	3E9iZ+qciL5b42vFweGQk6iDwmdHAAI2k30VBujelhKiJI2Op2F0n/S0Yy/TYZKsx0/kElY5u6f
	RWJpYYARF1MVBpaUYTNFL9fEBJ9fpDWEeFhNKXL6sYK/d8pp/zZGoyR1rkYFoz5vb9kzxxKXyeS
	B823h3OLSNaeYl6uHgJwK/3beXcy9qR2wG1Yku9qQkI/
X-Received: by 2002:a05:6808:1456:b0:4b2:3e72:bab1 with SMTP id
 5614622812f47-4b2413e7cd2mr156530b6e.6.1786647299226; Thu, 13 Aug 2026
 11:54:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-2-shijujose2008@gmail.com> <anvRn4g9Ihn5eyVq@hu-ashoraj-lv.qualcomm.com>
In-Reply-To: <anvRn4g9Ihn5eyVq@hu-ashoraj-lv.qualcomm.com>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Thu, 13 Aug 2026 19:54:48 +0100
X-Gm-Features: AUfX_mzK2KYq66enN11TTUyY_bgBfEgK88jDGTBrTGSa-gkPWcIl2Tm-4YHdY2Q
Message-ID: <CAG4KcRJR9+KMsoWjUWjaMveTteqMUrFukTcRgb0SZ593Zqj=tQ@mail.gmail.com>
Subject: Re: [PATCH v23 1/2] ACPI:RAS2: Add driver for the ACPI RAS2 feature table
To: Ashok Raj <ashok.raj@oss.qualcomm.com>
Cc: rafael@kernel.org, bp@alien8.de, akpm@linux-foundation.org, 
	rppt@kernel.org, dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, jic23@kernel.org, linuxarm@huawei.com, 
	rientjes@google.com, jiaqiyan@google.com, Jon.Grimm@amd.com, 
	dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, james.morse@arm.com, 
	jthoughton@google.com, somasundaram.a@hpe.com, erdemaktas@google.com, 
	pgonda@google.com, duenwen@google.com, gthelen@google.com, 
	wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:51=E2=80=AFAM Ashok Raj <ashok.raj@oss.qualcomm.c=
om> wrote:
>
> Hi Shiju
>
> On Sun, Jul 26, 2026 at 10:28:11PM +0100, shijujose2008@gmail.com wrote:
> > From: Shiju Jose <shijujose2008@gmail.com>
> >
> > ACPI 6.5 Specification, section 5.2.21, defined RAS2 feature table (RAS=
2).
> > Driver adds support for RAS2 feature table, which provides interfaces f=
or
> > platform RAS features, e.g., for HW-based memory scrubbing, and logical=
 to
> > PA translation service. RAS2 uses PCC channel subspace for communicatin=
g
> > with the ACPI compliant HW platform.
> >
> > Co-developed-by: A Somasundaram <somasundaram.a@hpe.com>
> > Signed-off-by: A Somasundaram <somasundaram.a@hpe.com>
> > Co-developed-by: Jonathan Cameron <jic23@kernel.org>
> > Signed-off-by: Jonathan Cameron <jic23@kernel.org>
> > Tested-by: Daniel Ferguson <danielf@os.amperecomputing.com>
> > Reviewed-by: Ashok Raj <ashok.raj@oss.qualcomm.com>
> > Signed-off-by: Shiju Jose <shijujose2008@gmail.com>
> > ---
> >  drivers/acpi/Kconfig  |  11 +
> >  drivers/acpi/Makefile |   1 +
> >  drivers/acpi/bus.c    |   3 +
> >  drivers/acpi/ras2.c   | 509 ++++++++++++++++++++++++++++++++++++++++++
> >  include/acpi/ras2.h   |  57 +++++
> >  5 files changed, 581 insertions(+)
> >  create mode 100644 drivers/acpi/ras2.c
> >  create mode 100644 include/acpi/ras2.h
> >
> > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
>
> [snip]
>
> > +int ras2_send_pcc_cmd(struct ras2_mem_ctx *ras2_ctx, u16 cmd)
> > +{
> > +     struct acpi_ras2_shmem __iomem *gen_comm_base;
> > +     struct mbox_chan *pcc_channel;
> > +     struct ras2_sspcc *sspcc;
> > +     s64 time_delta;
> > +     u16 val;
> > +     int rc;
> > +
>
> [snip]
>
> > +
> > +     /* Ring doorbell */
> > +     rc =3D mbox_send_message(pcc_channel, &cmd);
> > +     /*
> > +      * mbox_send_message() returns a non-negative integer for success=
ful submission
> > +      * and a negative value on failure.
> > +      */
> > +     if (rc < 0) {
> > +             dev_warn(ras2_ctx->dev,
> > +                      "Error sending PCC mbox message command: 0x%x, r=
c:%d\n", cmd, rc);
> > +             /* Restore CMD COMPLETE bit on error */
> > +             val =3D ioread16(&gen_comm_base->status);
> > +             val |=3D PCC_STATUS_CMD_COMPLETE;
> > +             iowrite16(val, &gen_comm_base->status);
> > +             return rc;
> > +     } else {
> > +             rc =3D 0;
> > +     }
>
> Minor:
>
> Sorry, I missed in prior review.
>
> Can the else after return be removed?
> just set rc =3D 0 should be sufficient.

Hi Ashok,

Thanks for the feedback.
I will make this change if another version is needed.

Thanks,
Shiju

>
> Cheers,
> Ashok
