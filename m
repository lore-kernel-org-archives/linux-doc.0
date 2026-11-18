Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795043885;
	b=rG4zX3eOHX0KYyiffJXoDUAQ295/v5lYwMuZR97Wanwnom+mNEx262CvwuA22PaEiK5V
	 mtkolYMoDleB2LnBJX+hCtf9ytVmh8IOgVW7zTeNCy/SgHJqVLB5lSrfDtIpWC0m4ds4h
	 ZzzXr6F+aJWDtT6Ry7lBDfAWuVgdNVksAYQRJem3N6gOuZ9fccOpewkPAmW7G3xid79NX
	 N75VDSnpgMeuBSBmiRb6l8qxaxnfrJkVvVfHyRAsfC8XaCudQje/W/k2rNVXqEOUo5cSX
	 AZRkkHVdQQLPC2uiXt282KyWfBTrGEU5AIYyqUP6MeJRshSQ5/T4wbgk4xADVRiBRww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JPC1RAeyqbYuGOqMmGUi58uvgG+tJSEuOdphvL+a1Uw=;
	b=MZtL2Wr9Uokk4NCamb226AFgLYM9x6472ATB0+d2qa4FxeuMX4/plAsaOyaxO7XID+/K
	 3BUbMwRQbRf+z5XFU7kFesbPj6Wc/eUvLRTg6DO0Fn5UA8tmwn9oZCG4VuQS4EAKxF0xz
	 Rhy356EgZjooUiK6AI8yCPj/ptn35gRdUFiKvWAi53x93nx/FfcHpw11M4aaL8wQ2JMAc
	 oUNrHNdfXBUIZKHwYfOoeu5QId3/JeOHq/NS54C33C0TRVzWNw16tS3yKXwbHEmcghcgK
	 Ft59mTLd0LnPPk1kxM7jwvT/u8HYehb1esGCKqmz8f1fQ9YVUoRkW4WXLvsbPmh/r0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gMqYmTxx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510B1606A32F
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 23:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 510B1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gMqYmTxx
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50933bdf4bso89885066b.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795043884; cv=none;
        d=google.com; s=arc-20260327;
        b=VegTM41nlC/opVLsrPqSrCCBscg3wO+oTkABy3LJMRsHSgJwSaucubITmuOdW7du2c
         QAh7+5v5UgwlMI6smqn12SKjjCgBZI+WWX81/ZoJtY70ELsuQL8dAb1jArpm12WbtAtS
         ezzIXQl5WMDOtjhNkJCDBUMIw03mJHBmWXB/Kdxo14lZMvJFj/KIHx6BZ8ybmvRvdsku
         benAIZtlpIHg7WAIuLg2PzPpaLGuF3yZJNSfnfD7N6HIxE+6NVRM6TJnf/5p+R6iRgPw
         Qh3gIyk9c7NhJ6NDh/GsqN09tCvkvILOBzoB6YpGzf3Lt/bMfcNj0MHuatGH1TGxtBwX
         FVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JPC1RAeyqbYuGOqMmGUi58uvgG+tJSEuOdphvL+a1Uw=;
        fh=XBkwRnP+sQW+2tdYqwRsO9AnFWT8tKgZBp8XDeuYUZ0=;
        b=cB8Fs8yNPllijagR4uZxMMoPV5YBTGDQSduoOyLPZS3yKEWpXHsiW/hKmgBo7kotgh
         E6B3AqcHBuXClDKfl3DlwdyxNEK89rkKU/i8fLKjb6QoWtTZBzNgY67v4r4P4ZsS2zC5
         1Gv2kqzp/7eeIZTmGHQrz1a9weSQR1EtHyRl7RW3KKKJ6/HAVwByfEVQg/+nGdyjE+Yl
         EnjP9MB67V3Pa3aedrH26dpZfJbF6d52VoOxTxu308YFij9rM0MtCRQWYJaGUUL90yjI
         tLDcdjEntXXNHTgFmkqDPWFonp3MDbGdcEVlNzIgKBAyeM+pr6TWZJSzRkJ1qmNUa5V4
         3slQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795043884; x=1795648684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JPC1RAeyqbYuGOqMmGUi58uvgG+tJSEuOdphvL+a1Uw=;
        b=gMqYmTxxxzZ9HGz8ByNTixIytfLUOljdot+AsdWACnOc4M6nV+P2CuwwqQ+cFhNySD
         ijUZb8IlBLZwar+L2LfAd8K6Lc2JaG44BnYfdyrp0ZEw5i2YrtuT+y3Ga+iN5VsmqHtE
         qyoUk0lptnivIulrEftIYMo6ZiuXlYLkptY9ccthmYaTbCeBL7SkmfuaD6QjEr0ryUbt
         THS0hL0+MidksYMQZ6nowTIvqB5VQcrFDyAhpflVFZXq4KnuIP0ibiZW6l3HNh27vBxt
         ksMs9Nl88jZNneuABg8MrBigv+AOj/rUtxtFz1WxIbhdYar3e/9BQ41X/Hd0/41ozmMo
         xCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043884; x=1795648684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPC1RAeyqbYuGOqMmGUi58uvgG+tJSEuOdphvL+a1Uw=;
        b=nDEDIjV5XL0I1ZdNZ05wGqY8wUfChohFr4nRzFrWTszc7t53y+XThfKDz038Lfovah
         +5LLvoLDOeEtMxby2T5nlFHCl69+RCRH50YqMbniMnGgwpJKx9pscODfFgF0f0DIcHL0
         IoCXRr16N7vGITIzJ2qtpgehsgLjYxhkTrnquEssWJfy9uhExBQC5oZt8XwaPPF49Z8p
         nvCa9ZpQtl7FRvq5hfyakj1P6RM/Lkhf5+CYLNOqQ+N71AnB/dPVjn7GNrp6mHivA3re
         JpQkKIO7mpTgE5dlf4ABe+LpUK8t1jkI8CLrTlitmFT0sPheW01AO8nMiLy2YYbupkDG
         MmZw==
X-Forwarded-Encrypted: i=1; AL+hErHF7eB2ohMl1W9Q/NoUtAy42gFBbvPK+bC0dgMVrpU5nJTQ2tDF3LO2vYLGfe6Ca2uvAcBjByPeFlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z7BktRG9D81J9ppHlldKyvBDsH7iWl6YthNq5MyPqhi8cQQei
	TNFSSR5QtwkkSJ4FeUfGG0DfhqMhPQ5MRAoWnqBbAnok8VyX8rsBMGIEskaMa5BZl6hsvQoOQMN
	o9Y253oM4F9BlMNUKfkNP8o2XwEaHYhGGbFvN1zjj
X-Gm-Gg: AYBFou3j6WIJys3GmquQytFm9nvGXt1mlmHWeSslIqmsDKmk7o7U9pHZY7JeUODCmZd
	1h6wdOoKttzWZD2QxcQGDeE/kDO0808SWaQAB1tkAet3FSbAS4lxDRhMxP4BkD1EO57OeFxTrOE
	Z4zwZbtFnf1ShcsIouT5EI+bpt+o/fhVHJv6A3fWVqng8eiF80G92HC8za24j8FmzgB9hdFHyqg
	VwaaenZWwLgqlXriysMpmItxAKy6nvF8oCL16/ioQaVW/Cv2fQxwf47wVraHxvTBwKj+16fQyNJ
	BSxVPunsTbc9iDuxBRKYyYNjiblG54TMEl36GZPjUFh60Ddpoga43FObxXDvmlZTBjp2z6ZKprP
	Gad9QRytO1QAbDVqpUK73Zgs4w4k0C6C7BgmjOg==
X-Received: by 2002:a17:906:f58f:b0:c51:2e3:f426 with SMTP id
 a640c23a62f3a-c512b79e2demr9058066b.18.1795043883126; Wed, 18 Nov 2026
 15:18:03 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013162529.1928093-1-dmatlack@google.com> <autxCZPJ9yiE2ucq@google.com>
 <aut0H65XKAHUqPR9@google.com> <CALzav=dp8HvdK=9cAkGfbsJAeckyU3_y7rCRM22R7+AmTTtxMQ@mail.gmail.com>
In-Reply-To: <CALzav=dp8HvdK=9cAkGfbsJAeckyU3_y7rCRM22R7+AmTTtxMQ@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 18 Nov 2026 15:17:35 -0800
X-Gm-Features: AclHuK_BmYZZLmsTICieOxQ9QtDw0U6EdYtEs__fOCufTHy2p7TcHAXRToh2pGA
Message-ID: <CALzav=cj3GuYU3wmW5GPSy8Rp+4xYjm3vonDBdi8TTyWSgxPCw@mail.gmail.com>
Subject: Re: [PATCH v10 00/13] PCI: liveupdate: PCI core support for Live Update
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 8:45=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Wed, Nov 4, 2026 at 10:06=E2=80=AFAM David Matlack <dmatlack@google.co=
m> wrote:
> >
> > On 2026-11-04 01:00 PM, Pasha Tatashin wrote:
> > > On 10-13 16:25, David Matlack wrote:
> > > > v10:
> > > >  - Save and restore the ACS Egress Control Vector along with the AC=
S
> > > >    Control register, sizing the save buffer from the HwInit Egress
> > > >    Control Vector Size field (Alex) and drop Bjorn's R-b tag
> > > >  - Make CONFIG_PCI_LIVEUPDATE depend on 64BIT from the first patch
> > > >    rather than adding the dependency later in the series (Pratyush,
> > > >    Mike)
> > > >  - Reword kernel-doc comments to read better in the HTML docs and
> > > >    spell out "reference count" (Mike)
> > > >  - Replace the version number at the start of struct pci_ser with
> > > >    required_flags and optional_flags, and record the size of struct
> > > >    pci_dev_ser, so that the PCI FLB ABI can be extended (LPC BoF)
> > >
> > > Hi Bjorn,
> > >
> > > I am planning to target this series for the 7.5 merge window through =
the
> > > liveupdate tree, as we previously agreed. However, there are still 6
> > > patches that lack an Acked-by from you. I believe you might have
> > > reviewed some of them before, but the tags were lost during subsequen=
t
> > > refactoring. Could you please take another look at the following to m=
ake
> > > sure everything is in order for us to merge the series:
> > >
> > > PCI: liveupdate: Set up FLB handler for the PCI core
> > > PCI: liveupdate: Track incoming preserved PCI devices
> > > PCI: liveupdate: Document driver binding responsibilities
> > > PCI: liveupdate: Auto-preserve upstream bridges across Live Update
> > > PCI: Save and restore the ACS Control register and Egress Control Vec=
tor
> > > PCI: liveupdate: Adopt ACS controls in incoming preserved devices
> >
> > Thanks Pasha. One more for Bjorn's list:
> >
> >   [06/13] PCI: liveupdate: Preserve bus numbers during Live Update
> >           https://lore.kernel.org/linux-pci/20261013162529.1928093-7-dm=
atlack@google.com/
> >
> > Bjorn's Reviewed-by on it was dropped in v9 when it changed materially
> > (albeit based on his feedback).
> >
> > Alex, could you also take a look at the two ACS patches? 08 includes th=
e
> > Egress Control Vector save/restore you asked for in v9.
> >
> >   [08/13] PCI: Save and restore the ACS Control register and Egress Con=
trol Vector
> >           https://lore.kernel.org/linux-pci/20261013162529.1928093-9-dm=
atlack@google.com/
> >   [09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved dev=
ices
> >           https://lore.kernel.org/linux-pci/20261013162529.1928093-10-d=
matlack@google.com/
>
> Bjorn and Alex, these 2 patches still need your R-b or A-b tags, and
> then this series will be all ready for 7.5.

Thanks for the reviews on v10, Alex. I've pushed v11 addressing your
feedback. Patch 09 on v11 is now the last commit that needs a tag.

  https://lore.kernel.org/linux-pci/20261118223704.3286085-10-dmatlack@goog=
le.com/
