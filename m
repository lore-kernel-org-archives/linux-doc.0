Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629804;
	b=QltQFt8hLRa22V9IiB07FuH2rJCHDDELa3iC+ueCiY4p6cGFqE1c6O+jlg5DahBoqq4Z
	 JHcnrZ6UeS6nB6ValrEnqTVQyWgOXy/BBqxphTQLkD4njv2Vfw9dZrNC84wk3BqEr0fwq
	 IxYs1Di/ayGflFaBLDngxbY/fScMykEULx8EQ51q836EqXKbWsdKOjjBBPCD+TLNGuSjV
	 5fSx98yCR9E7/MYeAtKi0e4ZfpT1shplkvUeWDl4/kO2RSPR2p08JhsLQa6rRE17nQeZw
	 Rtpe3jzLX06v1MBF0jgUPEs/1X1dZcdaNecv/W4AiiFTRxTlJ6nBaOcVHpVchH0XAFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
	b=YuNcyMdarZ6fGRNH/ODXvzfJzozuEQIIk/+4t2QCSxOS2JUvGlP8sZVY8wxSu3Ig5tqh
	 w/LJ3CBNnzxr8VctHzu8Y8ZGpCRfdZTtbvon0SwPaPBOgdrE7lgVwUSMYXOEqE7UNQg+a
	 zdvKCa1xe5d197bys9hshk133SabUQgNXjhiAem7z88Z0MBfb4HbtZx6jb/O2yfbJHJwl
	 3/T23aM5uLk3sFmx8NveF+ududwdQg45u0/U2DEQAy7JvsU42gf1KFz2zQ8QNoZuxPgbm
	 n5eOEMrMAV1wiWogbOca/rYglm3AdO6hPYWHHsqxh34HhvR7QZXD6W6ASz77WQhKkbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A95H94SU;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F9606A321
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 18:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451F9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A95H94SU
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f045b921caso35837825ad.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629804; x=1796234604; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
        b=A95H94SU9aU41X9Qdw1IDB9XFy9sE+pVMkssDqz5UP6xSP3vg85yutqk/5Ml20CrFx
         8csRNqN1wMi5HgLKS+Za1S6ObBSTEG16G5Wadl0S/zdF+vZuNph+oXSFiv5qjvVqsHCs
         /+QNk36QzE0ZAeuPGsRdGF5/vNYWdE5/DNEYfiPVfRivzQTnSlIiQfpXE+6Nq6HLZQD3
         I726J+6XoLyFWiRRWW1cLvOUnTi4MsweX+FHvrqFfe2XJ9ihDPu8JNrm9da3ym2IIWq1
         QfQY75kYGmaA/GkOicVMnxrkmTt6nz3SpYVpXZRuI34K+WOMApV1T46NwXAed7AlVt8h
         lqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629804; x=1796234604;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
        b=T/RebTYjid6muAn/rR5dtUnwXisPU1auk81F8tL3CNFcRvK+LVnnMy7vA2Gk+e7hp2
         YY3zORWnuwQcPhShFQvNdkFD/UyZ1tZBzbH0kjth7C9Rhf9ScIlW+T5XagnN6rEO5pRU
         0OmUiHMzk7p+licMro3Urr2Fzwr8I3sqHvpu2nD1zjkimzMg9NLShZ4Egvpy0zZOBWO3
         39vC2kK70P09JAEM+ueE1hr/Y28z0UxrBHZZU80fryV5eLyCCAItk/X9/OKDY/IrNmoe
         NlPgblQEX0gwD8mJOl9dW232DGGNtIoDeQ6VbawHaKIOlnO4cvp95lzlNqwNREeWqCw5
         rdGQ==
X-Forwarded-Encrypted: i=1; AL+hErGUr6h0plDL7+xdoax4tP3WCXSRiPLf79ZZLR3c5bW+gZHmQ9H1WMR3ZdamNJXnUZ1XqrOjaKzyjJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GORvHox4mBNamM1vY8XqQOX3o88bcVxoldXgagqFTuaCI1Zzq
	E6p8Q6xak/JBDqlMgHDtjliSlkB2EYq3MmUVuX69rGz8E9gF3j154wvLJ81yZCMW1A==
X-Gm-Gg: AZFdTZfnGkqvwVq6aOwyNX0agyu78uxBkH4ZDrajNU4PPTfaazilqNIdadEuef073bo
	daZsJFRb5fmpvd4u88KByCGuxjBZhhY+rnphef725wo01BYCYPowjxog6Vh71DaY7S18F5nZ8D3
	XAhWjDgnzPMtYFaPoWXPoUueHX2N4kTBgRn/U4Dx0aBvs45g9eTTyyCuJ93jAJIkTRSL0HswjAm
	6RvXIkmoXaEc69YypxFcE+0gkKnjBFpXNKd9wflaOMZChWr0aJlDU77SoO21Owqs4z7FCK/e/us
	Ry4ruKO54S0CSc34AqiyHya6HpykBTP15BeDlBiSPR1HGZhMr7hp++785PD22ypkhf1Tr29XNzx
	IrHpD7KF4bEPSRaUqbLIAf137NhVnh69C2Hwls4kID/8UqQXy2kA7bjS2k7q+H3rYmJI+5FYOPP
	uvoE4I1QQFgb28KBlnqb8n+hVVEtyyBBkefL4/krz1x8HIY1NunBQGM014fgHRnSsMNOFuGF3KY
	/60bYrS6MrA4ANqB9qjyuO84TQZzVWZJXEAa+QGhkVnHLZ+4Uw4GNKfp/up0VLP9j6gbHBgz5EQ
	JS14mistImXPHmKLm0paNjSJQzjfxHqB3hoX3lRFwhnZHc2EThX5O3oUjVzsWdOOWA==
X-Received: by 2002:a17:902:f54c:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2f03f1cfbe5mr188390265ad.58.1795629802894;
        Wed, 25 Nov 2026 10:03:22 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm91361725ad.75.2026.11.25.10.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:03:21 -0800 (PST)
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
Date: Wed, 25 Nov 2026 10:03:21 -0800
Message-Id: <DN4HN2W6ZVES.289H6BZD9U7KB@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, "David Matlack"
 <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <graf@amazon.com>, <jacob.pan@linux.microsoft.com>, <jgg@nvidia.com>,
 <jgg@ziepe.ca>, <jrhilke@google.com>, <julianr@linux.ibm.com>,
 <kees@kernel.org>, <kevin.tian@intel.com>, <leon@kernel.org>,
 <leonro@nvidia.com>, <lukas@wunner.de>, <mattev@meta.com>,
 <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files
 across Live Update
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com> <auzftbPFO_6XBYVw@google.com>
 <20261117220059.GA2250529.vipinsh@google.com>
 <DMZLLYOVIGOU.1RXWYJN6UQTM@google.com>
 <20261124234830.GB3545683.vipinsh@google.com>
In-Reply-To: <20261124234830.GB3545683.vipinsh@google.com>

On Tue Nov 24, 2026 at 4:22 PM PST, Vipin Sharma wrote:
> On Thu, Nov 19, 2026 at 04:06:38PM -0800, David Matlack wrote:
>> The incoming kernel computes its own virt[] and write[] masks and
>> requires both to match exactly with what's in vfio_pci_core_device_ser,
>> otherwise it fails the retrieve. On take-over it uses the preserved
>> value for bits in virt and its own freshly initialized value for the
>> rest, like your option 1.
>
> For now, we will be rejecting any changes and in future when we add
> userspace opt-in mechanism then we can loosen this check, am I right?

Yes, any difference fails the retrieve.

I don't think the opt-in would loosen the check. What changes is the
masks the incoming kernel expects: it builds its emulation for the
device with the opt-in bits recorded in struct vfio_pci_core_device_ser,
so a device that opted in to new emulation still matches. Devices that
didn't opt in get the baseline emulation and keep matching older
kernels.

Separately, if we later find specific differences that are safe to
accept (e.g. a newer kernel allowing writes to a bit that used to be
read-only), we could relax the comparison for those. But that's
independent of the opt-in.
