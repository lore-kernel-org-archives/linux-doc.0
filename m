Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA73EDE59
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608473; cv=pass; b=O81Yqh4gty1b25GhLc/p4S7NjhgDZj1FEOrvUd53u9wupFin0r90gwyUw0pAjGUp3N84oNmLnCLpauDSbbEra1WrNzMwhX/FB9YwlXenW2debkdBoHrtJJcgQWWE4rxVO3x3vc00xY4t30KGZDogXIyR5t+UCVXkSNOLrqFHqcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608473; c=relaxed/simple;
	bh=4pDyMhr5uGS380GtBwgN4Uu4uwMBfmqkDoD0H9P7NHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tx4Dr1Yp9BMGI2qW644xqX1GDHTN3H9kvZQI7MNJQl57eIfs/vupwd+5kxceUFokTj365YSWNM/TxhbokgSVLQrwwKgQGHD9LIa36ewdLs28F0NkfCxGYo3Y2A/W1erd0nKqzJQpMnO962L1gO7+2UgrRCK5/IEfCxz1EO4eD/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6fJUvPW; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6fJUvPW"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b59772d441so58129876d6.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 10:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778608471; cv=none;
        d=google.com; s=arc-20240605;
        b=PBwQ2ebs+FwiqeZbFE293O8Ru9MNlNfmHUZFfLs0FTlE9sQVd12GITRhSBI4kKqsbD
         ONjIM0Yxt0fNZEDZKa+0HJaBGltnmcDlXA45PALYnL6xdvj+Of+00g1sAU7scuY7xOig
         TADANyZ+8iLOCn9lR8kPYa71M0ctMyEOVqgvmNx04pv9giJwvIcU2wLNqEDCw8l5k83L
         mSIUqMMUY5Mk3sR+7Scvl221dZ7vBXSV8GeOOQDT+p3SSipgH/96KpR0cou5SIBvICX1
         HIVF7hOfJFFR6LtCtYzi9AK9c/NO57cD1u5BK8cBo/opY5tOzeg0IEEbPbgveDrHsLg3
         H7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6V/dI7BfU6SQAb6qJiqMnaHDUf532gyHk6REavVdHpE=;
        fh=13duV7VSzit4ESUXm7DvJzRnmQXLxhSnrC46s8Ob6F4=;
        b=cYXHBB9xMe2nga+sRd8bV5p3PGlfloXGfWEWMcwN6ByywxKBAoyaRTpXx0N3+HECOe
         RgdiPCsoqTW2MCKwqbkMyXczSbprjZJOywoeF8svZAYNWBLgV1y4muBNxLmKgGW8zUWk
         GKliER1b0AJVfmh5qM6VudhXMFAqWFSs5CzkFZdPHCOGIMKGD8FKgG9/mCzNoxLzxqVy
         soq9bVyONFOlY9tQzTCMGFS4At8bjNBQe5xOy6q/0Msgvea39HA3+96+UdRuIdB7vDuf
         TUFcBJ9smRtZWYXpnEWTT0X4Wta32TII65TA1G7scZqWVVHKEWif+vr/VVxnWwXVmWXx
         5dIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778608471; x=1779213271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V/dI7BfU6SQAb6qJiqMnaHDUf532gyHk6REavVdHpE=;
        b=o6fJUvPWHd5vLCIEAN42w9gJlFbV29NfPcwbzbFiihGmzxPA4Ezax9NRR6/GzCDr+F
         utQoZTs5DDWZK/Vf7BwmrW9tBPSjcnITqb0W0QOMCxGY8Z6q0FRpIgASdTuM4bhl07ku
         I/DK+UosAwXfeHiJ4lSfruiGngmr3WdeYTIZ3vR6BdlxPc3uPiuOoWQl3ZZrnQ7a0egv
         EjoZsi86ptZZU3JR/wl8RxCNO7t3ZfSJJjcpFdPw2WqtdE+NPSG8t8M5k2jqpz9yn53N
         t5IlOk46QTHT1+GMFUK6fCn6EjEVq4JeiY6BIVwZAlFcmk28bzLZaWCA9rJkxrEmUmyZ
         xaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608471; x=1779213271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6V/dI7BfU6SQAb6qJiqMnaHDUf532gyHk6REavVdHpE=;
        b=OHumMRrZXVawbZAFgcvdiaTWZ2QYWDGt1FujkOTm+EIDM3SdssZC+gVHNUxGVbfsHk
         Z3+GM8/t7y6c7W+lhYairfc0qFespR/PCZs1LgqDee77FyuyQVgwivLwhwDOMH3n2OTO
         mo3EPSHSayTx4j2juX1DmZWggEouV+c29oFXNp96c3m6e3divrxwW1HN+qByVB+FOrqZ
         gvkSB5meZyYD0K3wMhf0G2x/fWnBf6ekrnl1lnSYBHRUPEDUsOjxXu8cYi9pqtd1dV2z
         xGVwuTg2mr2VbbcmjBT5Nxa4+3VJ7cS0ANZtvq3KAPFP5iQcA3XTc8L+KSd3okNxggRs
         K9bA==
X-Forwarded-Encrypted: i=1; AFNElJ9dyzvRiliJS06rR3obmlmmEdDn9nAkLJrlx0ovMzydGi25qR2VUvEpKcdkVGmwjmmih9ORdU4NMnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkI5PEiAG4x0Du8EwrRp57hxTwWswnzm5U6z6b/qW7gc4l5PhJ
	TSV/946DyBFA3Fuu6qkWzcMXlhuX9FJlUO4Qb4mBCFvXwBu1r+NpjpuWJYBTZ2LBJRxRONdT6l0
	3wpag3xNYVIdE1xuRldbGKJcKyGS/NT8=
X-Gm-Gg: Acq92OE5qeFB6ABHQ36ifV345SpzvBm019qNvotYW7/Ev90+rbW7NjeggarJE7wwOl3
	DDT+KaEFb5YBbe2dUMOj+OJbMIBkdba1tumoCP5e8T/fDbmzWgKjPoSEOmxsPKSLKHuvlnoIZxL
	BZkfoysZvf32Dy+7dI0zEF3jvZD1AH+PLhSuJHmXW9PJDimCt9sIoVK2+pymJlzHJbc+meuHti9
	mP69DZSwhp6xQ1+RnbY3YQpLO6S7/tb8sL3dHFHmd9xOrOi9Pt8FpcdE5ke+Rel4Gw8B4ti0mBo
	n8UpPSyh
X-Received: by 2002:a0c:e092:0:b0:8ac:bae5:7477 with SMTP id
 6a1803df08f44-8c6636b53efmr52293406d6.26.1778608471093; Tue, 12 May 2026
 10:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510043510.442807-1-derekjohn.clark@gmail.com> <n533qs94-7o4r-p5r0-04p1-68q1398n5785@xreary.bet>
In-Reply-To: <n533qs94-7o4r-p5r0-04p1-68q1398n5785@xreary.bet>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 12 May 2026 10:54:20 -0700
X-Gm-Features: AVHnY4JgHMJKUiNg2AuyMgiSlUnVtaUfuAB2W9773w7jKTZlo-D2LmWGXSgL24w
Message-ID: <CAFqHKTkkKx_3uJboGSQ3a1ukF5W8Mv0+jneuB+jxVoSUSmpTpQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add MSI Claw HID Configuration Driver
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, Denis Benato <denis.benato@linux.dev>, 
	Zhouwang Huang <honjow311@gmail.com>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 9:13=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Sun, 10 May 2026, Derek J. Clark wrote:
>
> > This series adds and HID Configuration driver for the MSI Claw line of
> > Handheld Gaming PC's. The MSI Claw HID interface provides multiple
> > features, such as the ability to switch between xinput, dinput, and a
> > desktop mode, RGB control, rumble intensity, and mapping of the rear "M=
"
> > keys. There are additional gamepad modes that are not included in this
> > driver as they appear to be used in assembly line testing or are
> > incomplete in the firmware. During my testing I found them to be unstab=
le.
> >
> > The initial version of this driver was written by Denis Benato, which
> > contained the initial reverse-engineering and implementation for the
> > gamepad mode switching. This work was later expanded by Zhouwang Huang
> > to include more gamepad modes and additional features. Finally, I
> > refactored the entire driver, fixed multiple bugs, and refined the over=
all
> > format to conform to kernel driver best practices and style guide.
> >
> > Claude was used initially by Zhouwang Huang to quickly parse HID captur=
es
> > during the reverse-engineering of some of the features. Since Claude ha=
d
> > already been used, as a test of its capabilities I had it implement the
> > rumble intensity attribute after I had already rewritten most of the
> > driver, which I then manually edited to fix some mistakes. I also used
> > Claude to review the driver and these patches for any mistakes and bugs=
.
> >
> > Assisted-by: Claude:claude-sonnet-4-6
> > Co-developed-by: Denis Benato <denis.benato@linux.dev>
> > Signed-off-by: Denis Benato <denis.benato@linux.dev>
> > Co-developed-by: Zhouwang Huang <honjow311@gmail.com>
> > Signed-off-by: Zhouwang Huang <honjow311@gmail.com>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >
> > Derek J. Clark (4):
> >   HID: hid-msi-claw: Add MSI Claw configuration driver
> >   HID: hid-msi-claw: Add M-key mapping attributes
> >   HID: hid-msi-claw: Add RGB control interface
> >   HID: hid-msi-claw: Add Rumble Intensity Attributes
>
> The driver looks reasonable, I'd just like to propose that we name it jus=
t
> hid-msi to follow the usual HID subsystem driver naming standards, so tha=
t
> it can later be extended with supporting other MSI devices.
>

Hi Jiri,
Sounds good. I'll do that when I fix the issues flagged by the bot in
v2 and I'll try to have it out some time this week.

Thanks,
Derek

Thanks
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
