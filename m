Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460827;
	b=E1sU3juEpRTn+ZIFHv5E4CRo8mc4gkPn6mwiklFCDm6y99g3XDHbmih9SrTiVmYWVIj+
	 4b2vTfzyvpZ9+rE6D4gbaDmLcLxwg5g7+5VxOoQ14MjL6NaQw+wdablbKXACWPsIgSjxI
	 RW5TcbM3RhHStqq1FEsoHcccFupQMSqHyqUt/O7X6E90F24RvkrDcaAuAcYYeT1f/ezjy
	 1Hdtgjfz6PL3VYXctuYoPGSZ1pVFUYjde6tt1RD8dhuj9fRYpNXiWeqpROX/TjDj6S80J
	 7rVtMK5oIKBhRCZBS0bbPvXQib0D4k4EvJOClWP2zIqHE4/XYajwRgS4BPDjrmsQCfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=+QayBEQiT3Jk/QfXswrgR8TXyR2eeqhw4QSoy3wq6uU=;
	b=SewJIqpNoLsJ6Hg740TNCsu1gH1Dgigi19ZyKZbYic/wYWuSdEti3yT692yIuC8ii2kO
	 OQo7ufu9jcfTO7/U/1A6X03OSWxJ0vC+cPHxxvexDsHc3M/9FhyqDMF7ExAUE6ZNGYvCe
	 ml2Y2WZ1iDGR2hKW83MpWr2oBmJIDeWIa2SbZYDC03diXu1kbFyK5Sud+aUjlUw7rtdVh
	 mMMz6Jui/VpA3zjz1eB5bh+/cBwCIQ0GNJv/riplqB2ZJrcP4HWVr6RV8WWiee9KXPMhE
	 zTDHklkXki3j4ZnvRcO+2R5KE3Y+NvZ5OTInnituCAm8ZYlj5gwxRp0RWStmaBZs8Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=REIzlfrF;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859B606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1859B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=REIzlfrF
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1821885a91.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795460826; x=1796065626; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+QayBEQiT3Jk/QfXswrgR8TXyR2eeqhw4QSoy3wq6uU=;
        b=REIzlfrFYkXmm2za3oRGS4hEZ7IZaLMiJkaiAzkBbUraNSbjgnesJKnULzv5ln4ep/
         9Fk9EpVD475Fqa7XwehAMuagnjrRRxWvymK4PDFUL5fdSnBSj/9icSkDs2rWD1ueJvF0
         PqxGIUIElBYrkd4Ldrh5RdOOvhRjyBbjrvjrhIy15MBbPIG8ddOYoqTOHzBDtZw11LnN
         FH8ZiH3EiN5TRJvZ1tt3F/eGCGg1KNb6dT+0+bFBEAMLxSHiq5drVND8ZYVdHfvVMwov
         tOrVAK0RaMRCG+ja12sISrYGQGr/WZFo9uZC8kJyVlUqGmiLWVD488IHqd73MXaUVO5y
         nZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460826; x=1796065626;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QayBEQiT3Jk/QfXswrgR8TXyR2eeqhw4QSoy3wq6uU=;
        b=HCOrdXpc08cHfhHNmv1ALTYiUJyDujSRKzQE5otPPatQFf3iIoo2ieKg+Np3MUY/nW
         z8XnvhRDJwXf5M2ardnJ+SJezi4ZWTD+H4u7092KWduZMPgUwx/bOVmchwcHbm+wfLUq
         rBouZgNfqSffI/uX5TULR8Nfck80bIYhU9BqAhm7ph/fepAXUMzEGAYpNk5Ti0lOSD6P
         U33hBC4Q7teTai+gZf4Hb8GFHZCUKQ1+x4Rr1qXTO93EoucbUrTfD48O1KIKagQORFPx
         CcXy5rgVIk7TYEhi2ijuF8TpgnvT5Qq2KiZG4T50s+OnCMQW+eoc5SEgleMe+pffghhV
         huVw==
X-Forwarded-Encrypted: i=1; AL+hErHTX9k/WhcxC+0K4ipsl/VbRRxP+9JNbzivkgVIxU47H880z8TNCdN95BafTsuh5WzUW2bNiq6gRKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fjSy0EKGGSPCOYmkMmAfFxkvIRlLAp6YNP2Wb2GePeQnrAVGM
	dXOADnZiM64xazhtnQD05UrBk0BnuCVq3cUfxrWBtLvZo6jnOxieAjlO7SBUsCXgFg==
X-Gm-Gg: AZFdTZf9bKZ1IW614qEmxQSGZmNPbZvi0zJZ/k+b4Vp4dkYONmn/JsfhTUxUjdM98Wx
	h6iqD40+oQ6KXWraFqvz5H4bzxmx2HJ991UOMd/ILisT22O/Fku0Bwt8pLEK5ronTisabHV7Cpt
	yyJf0zmPZgEYgjt9oQFtSg+8MUjLEFDk8EqooFRdb9WygEti4QDSPUoumTf7lxIbRRWOl9FybYN
	epFxWkudNqv7EXl+1GtUXbnt1rGDmGCPwbNLFEIQryuMR4H06a+wZlaSA7fy+AZYOmugDoaXmmN
	hFA9mt0JfVkAHPOirSbfBz3b22cTr21rigzXDCxMLrlbeQ6dcOEIM3/WYnE4CCQcHnsjjFw/HIB
	J8xiPt50ReDTLNvTxNiWIo/w1AuxKcEo/8juewG9zP0y3RBRAt0f8S469OfK7TQdh/EL92F/Wzf
	MwaQxgHz7DvVSsCcGwINAOxIHLGAHq4JcJBFDam7YQJ6j/4u/lphbE/1SUQ12/7ZbuxeCYUgD+6
	1bqDHXoblp2H64v4/XRFSLoatDnuW0sdMYlCzqVuysTr9iU2SNGt8FW1mHIdayEWuABvXU1N3vu
	hCWlK7PwdkX4gY5z0FdatY88Ywqa2B8ifZxVTtTf1geNGORGtnrfCUh5O7DCMjzA
X-Received: by 2002:a17:90b:1644:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b41c9a9cf7mr10724478a91.61.1795460825743;
        Mon, 23 Nov 2026 11:07:05 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm21961682a91.1.2026.11.23.11.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:07:04 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 11:07:04 -0800
Message-Id: <DN2TQRX57C04.ZT5UUS6AQ1L6@google.com>
Subject: Re: [PATCH v11 00/13] PCI: liveupdate: PCI core support for Live
 Update
From: "David Matlack" <dmatlack@google.com>
To: "Mike Rapoport" <rppt@kernel.org>, "David Matlack" <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, "Adithya Jayachandran"
 <ajayachandra@nvidia.com>, "Alexander Graf" <graf@amazon.com>, "Alex
 Williamson" <alex@shazbot.org>, "Alex Williamson"
 <alex.williamson@nvidia.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Chris
 Down" <chris@chrisdown.name>, "Chris Li" <chrisl@kernel.org>, "David
 Rientjes" <rientjes@google.com>, "Jacob Pan"
 <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke" <jrhilke@google.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner" <lukas@wunner.de>,
 "Parav Pandit" <parav@nvidia.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Pranjal Shrivastava" <praan@google.com>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Saeed Mahameed" <saeedm@nvidia.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Vipin Sharma" <vipinsh@google.com>, "William Tu" <witu@nvidia.com>, "Yi
 Liu" <yi.l.liu@intel.com>
X-Mailer: aerc 0.21.0
References: <20261118223704.3286085-1-dmatlack@google.com>
 <DN0FL1752MH5.1FSZE620OJBM0@google.com> <awKlfqlQYhphXCvf@kernel.org>
In-Reply-To: <awKlfqlQYhphXCvf@kernel.org>

On Sun Nov 22, 2026 at 12:19 AM PST, Mike Rapoport wrote:
> On Fri, Nov 20, 2026 at 03:35:58PM -0800, David Matlack wrote:
>> On Wed Nov 18, 2026 at 2:36 PM PST, David Matlack wrote:
>> > Merge Plan
>> > ----------
>> >
>> > This series is intended to go through liveupdate.git, the tree listed =
in
>> > the new PCI LIVE UPDATE MAINTAINERS entry.
>> >
>> > v10 and a follow-up patch were applied to the lu-pci-preservation bran=
ch
>> > of liveupdate.git. This version is meant to replace them, and applies =
on
>> > v7.4-rc1, the base of that branch.
>>=20
>> Patches 08 and 09 have Reviewed-by tags from Alex now. I have a v12
>> prepped with some small fixes from Sashiko and a comment cleanup from
>> Pranjal.
>>=20
>> Mike do you want me to send a v12 with these changes or send separate
>> fixes for you to apply on top?
>
> Three fixups on top will do. Just please send them as [PATCH] fixup! as a
> reply to what you are fixing up.
> =20

Done. I sent 4 patches, each as a reply to the v11 patch it fixes:

  [PATCH] fixup! PCI: liveupdate: Track incoming preserved PCI devices
  [PATCH] amend! PCI: liveupdate: Adopt ACS controls in incoming preserved =
devices
  [PATCH] fixup! PCI: liveupdate: Adopt ARI Forwarding Enable on preserved =
bridges
  [PATCH] amend! PCI: liveupdate: Freeze preservation status during shutdow=
n

There are 4 instead of 3 because the pci_flb_finish() logging fix from
Sashiko touches a different patch than the other changes.

Two of them are amend! instead of fixup! because they also update the
commit message.

The amend! messages already include your Link: and Signed-off-by:
trailers from lu-pci-preservation, so you may need to drop duplicates if
your tooling adds them again when applying.

After git am and git rebase -i --autosquash on top of
lu-pci-preservation, the result matches the v12 I had prepared.

About the Reviewed-by tags:

 - The amend! for "Adopt ACS controls in incoming preserved devices"
   already includes Pranjal's and Alex's Reviewed-by, so no need to
   pick those up separately (b4 trailers would add them a second time).

 - Pranjal also gave his Reviewed-by on "PCI: Save and restore the ACS
   Control register and Egress Control Vector", which has no fixup, so
   that one needs to be picked up from his reply:

   https://lore.kernel.org/all/awBc0m4oW9nW4hgX@google.com/

Hopefully I did this all correctly... This is my first time sending
in-reply-to fixup! patches.

Thanks.
