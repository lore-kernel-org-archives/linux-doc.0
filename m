Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51EA38911B
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485425; cv=pass; b=VOviUDTUNJMfHMpf6qgFPgZSzILqCAbfODogWAqur1t2zFUiPUdko0J0BMzsOq89NTo4Yp31EPUOWnrNiDJr79/OTiASDhiwvwEMC8MEoAJ6aRvNFcfgptkpRsrZLG36ZG6TZjc16D/5ITuaszpFFX28G7VTpF0yqwBk6WAdrUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485425; c=relaxed/simple;
	bh=lr8M7fmxQx+oenGID2VdP5yfHKsvKNwWZtz8MlvHV6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvfYs53h+kCB0HfSER9Z9p4tx9zeZC74eN1Lx2NbCp/xqfxtFqNh9WY4zcAIlhc7J0TmLCAfyGaaY/Q6XeRye+7Oc2w3+OSOJ5TCtoqMHUvqCvRxkxmhr3IuE7+fsfmTB5aNf71H17zvji50Kw1xhCSiuXqcbVkGPPDK1o2vKEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omizmiq5; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omizmiq5"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-82109f51565so1610382a34.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 11:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791485420; cv=none;
        d=google.com; s=arc-20260327;
        b=I2cvvekxOLW0G2fYWD/gmRIZ7SNmGvMmXvQsnTYyzZx6R9gatdp11WCUQe6szX/Chu
         2n4FlfcOFgN2orqr3qzXc6wlbZQJuTgBZIS7vJJjSCs8CHHM0EB5SFck4Rv5Bu7DGwR4
         zK0DH6jBQONRp7m4xEZnf/ZD5JEg0Lw17ha7dFTrHPLofJF/xH5O1cc/gGIhoKly77AK
         dN6jHYw3qV4pZ5sZjTsiJK1UU8Xe8U1RqMsiwt3NIn+et0ZRGdIXNysICjsmtPM0ekol
         tJ1gVOHULsQrkB6tQ0PmkHbVzZbv+hSryeIxTuC/oIS4B1giN7+oRZBv9H2ctRXJHXK9
         DyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HUuHUTe3yEqV1MPJyew4xZgwaSUycY+L6akjTIcM0eo=;
        fh=dC/kRAgq6YekLeFewxSDa7S9ndD2VGbPM9Ys6ad5+WI=;
        b=O6aQKiPvEHZUsSiNm7co8r4vk6JKTp9rHKEoGALoWn8YQMRxkGiPi4ljgtyYSNMJop
         1N+EyZRnA6suiVVXjSDNwHdBSQvdgo0UCGtNZ+ZGJ7/n/O1pl0aclPVW5E7bJ6fwpeBQ
         zgNM9nTgZeXdKzssLzIk2Za5xMqp/dlwrrDAXzU1qGq2zgqdrt+SqWCr+Ji7RRmX8Cqm
         1PR7/kxAvoJq3fCn1eFZMEf0BjvE6w4lz52hYMQoxr82G9Bh759aM0cwROF/LhBjCRm7
         A1dgU4Hyt9DhotOiNFczJDdMwQ1KbmQZqUWr1uhIhWAkKAsJh39RX8Wq3Xm+csdCMz3U
         a9yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791485420; x=1792090220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUuHUTe3yEqV1MPJyew4xZgwaSUycY+L6akjTIcM0eo=;
        b=Omizmiq5kZD2GJIYcjN5Z1UlkdIXv+r+rTOY1/VbtxY4WeYAI5gkIPlvbvki1uJfcU
         Z6h/3z2ll+vxeJ26AFdNi4EnbUF9DMHnopFSs9KsZIi/UpwN6chmQsGOgHx1BkLUz61t
         ZTKZQWZYRIQQb0EDPAAcCKbvrHJEL8dzIbREJ21QUC+HbRkEhsQnvvNIUxJLbaWzuqEv
         KQ9UA6TKp7GoVEwezvh4U+lPnKeWTYBsQW9VdGXTiGHUZIFh2b1JHPZT0SoS7mKG+AyN
         qKgqQsFh9AlcsPTK8ukKIuR7qQbKdBM3XsItH0z0cPag+NfcHjW0IYsFMMzLJNhhBtJZ
         SDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791485420; x=1792090220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUuHUTe3yEqV1MPJyew4xZgwaSUycY+L6akjTIcM0eo=;
        b=kqX5ZP2bkSHLN4lwRcDzX42cpSaQkw/fbkOYMI/0zM7lVoNCqft/PKCKg+si8cXj2V
         NFvvt5OYQ+MI61XmkJS9Ept1bFB497SMhbRTHOhh8iDPt4+puHbI0C7mtspdTBSBUJeC
         HVTtoKYv/UKY/YjzNhZTZCnHXidLJzb2cNPbBo0moQrQ5SCsSOObZJzK2/VK5LhEkCAH
         Ln/C+ztNkoGWO1b+te4UiYLigr29MFegIO3Rh5VzX5uutBzmEesWU5hwx2jccaf/JDQK
         7cVuV5tPPk6nzMcqx2JmG3QSoj+atS9iPFJwOFG7H+6V3ebg7rRhYcmO07lN5kmCJdHF
         ogjw==
X-Forwarded-Encrypted: i=1; AKwUvBzi77pnAU6xTmBEFJX1JUdy51x4AY9rWF0OAWeBosh+aavQMuO9DD0/cjkH1EsdC+pnECk1Un944o4=@vger.kernel.org
X-Gm-Message-State: AFuF++mcSo7ArBTNzEnizqrs4OlPXAyWAgf37gr2dcYP83SwpVO5W4C8
	Wbb3BqwGEcsZOybzgfzHsr6gHoioPnSMvITtW/o7yuROfHD25C6BfEzW/l1LcftR6Fa1GYp5FN5
	dRi1JsUENaTFKkDLGYGIVoEdAh9bvBgw=
X-Gm-Gg: AYBFou1Y6DK5wbb/as+aQYLfYSRDg8rS8pXz4dZuOQIBw+C7d+Ud//mJp3gOAHZLzTK
	jJLOI3nWIgEVBLUp8IWdNKUamzPTz+ntIDZl8PV5CO9tihBdOkgKFJ+E/aRWhD1J+rDspy4RN3z
	zs17TYNwuq622f1M1xxdWlBFPxJvQkmdNKNnXa92+dnoYLYgXrNf2H16qm3kWXOnIZE1J5rWUsH
	yP0eE90GBWMNeYShysOVPxJgg9yz8IkKqEYvVI2UrsPMrWLJcMiJSitsCcXMHcvFLPX1P1id2Hc
	qP53rXCowgnbc1Mx9APL6IuFQtcgFpTumJAEeGeuAMeZFZyzHfs0if8=
X-Received: by 2002:a05:6830:398e:b0:829:2af1:a07e with SMTP id
 46e09a7af769-82acce646e4mr6427817a34.3.1791485419594; Thu, 08 Oct 2026
 11:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-2-shijujose2008@gmail.com> <20261005235021.GBasQ3vXTivT3NLbBq@fat_crate.local>
 <asU7svV8g2Hb5DZl@hu-ashoraj-lv.qualcomm.com> <20261008030603.GAascImzt4cv8Gz49p@fat_crate.local>
 <CAG4KcRLhN9=6xeT4qfqKLFdukiZLUc7akGcWwXJUU1-qrfxTUQ@mail.gmail.com> <20261008174114.GAasfVutvsmAk8JGsD@fat_crate.local>
In-Reply-To: <20261008174114.GAasfVutvsmAk8JGsD@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Thu, 8 Oct 2026 19:50:07 +0100
X-Gm-Features: AclHuK-7nYIEHIpgx3dw55yERdZIxrZ2s_no432HghoTK3RqssmmaR0vXdDXvqQ
Message-ID: <CAG4KcRLx69BK+aw+exUzPe+BW8exFM2LLvN9pEr-+1BoGVhFXg@mail.gmail.com>
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

On Thu, Oct 8, 2026 at 6:42=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
>
> Shiju,
>
> On Thu, Oct 08, 2026 at 08:18:14AM +0100, Shiju Jose wrote:
> > Thanks Ashok for reporting this issue.
> >
> > I debug this. nows_txdone used to set before requesting the channel
> > until v16 and was changed in v17
> > following a review comment by claude.
> > Found this issue occurs when txdone_poll set and  setting nows_txdone
> > before requesting the channel, solved.
> > In my test setup,  I missed this issue, because txdone_irq was set in
> > pcc_mbox_probe()
> > with the acpi pcct flag set to ACPI_PCCT_DOORBELL by the firmware.
>
> What?!? I can barely understand what you're writing here.
>
> And tell me, how many times do I need to remind you not to top-post on pu=
blic
> mailing lists?
>
> Geez.

Sorry. I meant the issue occurred when setting the PCC signalling mode
as polling for the RAS2 PCC
(In include/acpi/actbl2.h struct acpi_table_pcct: flags).

Regards,
Shiju
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
