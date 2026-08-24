Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464739A040
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 07:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557276; cv=pass; b=NSVHB7dS60n2kjokQWtX5VgliUp97tk4S12tCDMS+4mqzg+1+YYKszFc3NXohc05Sczlp18nD8AuI/+cez1AzoeLZp1gqHphZ/cIPdIi1/LKXY6L3YriKXLXbTtEWKJsjZO0noa4dbzoDMYB/WC8tqFA+RLVtJd+0vR0R59JZNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557276; c=relaxed/simple;
	bh=mdsvrY0ISPRS0P8l6Q2ATVhO2qJcd3GXtM94ZK/661M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KV9ksOM0lugrjFGsTlM+od8QGKiUEc+ZbfrMQs1GPeDVxJX4SUhEx3mnfq7gnTjV3xfQ0pZsBKThFxxUQylA2qqKli8vviVVftU6ph3k7gRRqm54vEUEQXSIe9OxujPSj3PAF/6AHpE4+D7d3ig/inDcwZAXkxNdwDg+2EejeQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Q/GjEk//; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Q/GjEk//"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c08df8513so19135501cf.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 00:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787557272; cv=none;
        d=google.com; s=arc-20260327;
        b=iW11rFOpOg8MJTLJxIFB2AUz3RvGIgteE6Thgb0qEl0GrATLqyklX1lzUbnPUfEkr7
         KW2eDTjV4gJDmbrKtSt/tGS3eqtpfXctGG8CQ9osrZTtLLgrUQPQ1LKmny07xY1wNmhw
         zMp7UzW7r0DtjUjTiqnpjlrBh9Kr3KTUcRUAxXFzqOsHoc8w3LJltzQ7EVd+HftaP8nS
         Wy9fwn+uGOFRdgG++OLIRVbxaFpJ6NBavsyQx1lGowX63gutNaBHb3pgwZRHkSp+NOwE
         cndj72JogE+VcHzhoVjJs+kRDW1EliK6BYEBAq7irA81C6Ke+/F0iEa7dC1XiPuE0jFb
         +szQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Klk3k/9iOZSzHajoiDP/ePmCKQpQct/Ey07OIgVaiL8=;
        fh=tRITm6lFUzv1GWjri7ObH9/gM9z1kxZ0XIp+v2tMSmk=;
        b=ZwQjIT6io23JtlDQndBvpdqcL5x2/XX9+XRsW6Gcywd4Hgr0v0XePkWRYmRzwOk7j2
         7bIt2SVGEjYCXMewgKswSGL8Gl/vQYolH/OfpOpauSzE46sVLG0j120bBau7sMBv43st
         SS7ySElxaDp4CHs8IeEtQ39GtDl0m5HWQo3rR0ChIbwxJuKcXF5kFz8uYKgGvFL//fdZ
         2W7ClVOS1aV/0nHtXS6qk93U1Rp0EkRTPmJuMYbW96WgoWVuAfjeqJxe5/8C9RTCRsZG
         /9J0Z2Jk/TAy4x8yQQdo27o+wx4qi12m28Lyk6U1L4F2JWGC2XJCcjm5eGavEyKFO50/
         /daQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787557272; x=1788162072; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Klk3k/9iOZSzHajoiDP/ePmCKQpQct/Ey07OIgVaiL8=;
        b=Q/GjEk//wp5xYL0vEr/+Agzjq//Un/YfKCErgxJp8r92qnipH2D8XXriluj8rI9O+p
         OROlfSSqPMyu6evEHcBJrDoN6E/NWadT+iOazfy8ukAc/+N+wat4eM5mPINHc44W0etI
         ummcPk0e15zddKt/9Gkx/GbWoKVDhyvdILB9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557272; x=1788162072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Klk3k/9iOZSzHajoiDP/ePmCKQpQct/Ey07OIgVaiL8=;
        b=mdlsHSeUs3K3BIW5ZrJU6fPeBdG3fFqj0jI2sUxRS9PfmoDa9nlqoiiHk/AVYtFL6p
         98IuUpkPA63WQ7PKAb+c7niX99PVp4XlIeZXq4tA201Atvyf6XVJ9Kkc7ZUON0MJ4tUS
         xzX713wl5xW1dIaAWMO51B4Jhv/fFEDNrTR03s2WtRnH6r5CpnxvfOeysjbUHdGnfDSb
         Yh7bz0KtbzLcIW+EOCZPRb+xAb+GM5RK3OCZus2wZo3BBHbuFfr6NqQnNenmeOK35qcg
         wuQQCNBOpYLH++5AdfSbD6IOw/4ig5BMsPk4tZv11LRgc1Zr6DOBfB9Rvhvz1fIieueS
         o4Zw==
X-Forwarded-Encrypted: i=1; AHgh+RpN6V5ztME8L6pSmMJR3W5TTbe/hKXzk1lKu4h817tMwdAZqAHn1V5fpL8l557VXfxSS66EcJBxM98=@vger.kernel.org
X-Gm-Message-State: AFuF++m68ffxZHaypLzSCrGpYqjfXQHCimbiULAs1ZaR9t/K8Rj3Dt1E
	b1p/rwV9zfqVhXADtHJi4u4WMWAQ1cs4jCAUvPp7WAuoQSLuq/gmsOQmL3tHTnnjqPkP5TLKeqZ
	+c9QF9D1ukCY+tIhqjDeTlyYH7j/c38Y7NWXe2nu4ZQ==
X-Gm-Gg: AR+sD10c6pDT+uVcUI9i9c2BlCe+FGpUWTnWeWTGoub1G/1Qhxk0rgacSrj2GNIG9XW
	40MOSRZUk7VyWpRDYTMTUL4lgUyOUvVvySiiQ4c/dKxuV+BUpPzPCrLzJrwehi5AssHj2+0z1h+
	L0XE6odMu6hPnO0swO5PiPxPTGnjU9auTDao7bUVGZ+m62WCiBw5+u6tJL1NkD4KPDBlhfPd8AO
	v8cvvErDaiUOF2zDUYC88vu+fAZ+ha6m5p44TRW7/Cbbmwx71AgyKOan+QNv+o0oGWK3cHnaCjA
	VLyVXcT7Hkkirztn+LqEgcGATIfCqGIHMw6J0pUv+rXtmsKVs+aSZraFOxZcbvYsVVN0U53Vo71
	4Qb8=
X-Received: by 2002:ac8:5815:0:b0:51c:1117:c6a with SMTP id
 d75a77b69052e-52df56f0b73mr226396731cf.4.1787557272431; Mon, 24 Aug 2026
 00:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0100019fc572ca94-ec363dd7-3a77-484b-b4b7-f2503a0931a6-000000@email.amazonses.com>
 <20260803022828.75776-1-john@jagalactic.com> <0100019fc5739e5d-bc002300-eede-4c40-9ca8-a277b754496e-000000@email.amazonses.com>
 <20260806043712.GB3560084@frogsfrogsfrogs> <CAJfpegtW4bFn=oNfTipCxhiExaqSXnhXeBd6Uq15FpepqCJaPQ@mail.gmail.com>
 <20260811-baugebiet-hofiert-fanden-3354f4a5e820@brauner> <ab642f3a-e377-4292-b2ff-bc970f5384e8@kernel.org>
 <CAJfpegsC-D0AJij3E=dbKzZCH0nijE7+rpPut-EnRd3r0uCMtg@mail.gmail.com> <ea56c85b-d564-4451-b704-58448a07bfa6@app.fastmail.com>
In-Reply-To: <ea56c85b-d564-4451-b704-58448a07bfa6@app.fastmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 24 Aug 2026 09:41:00 +0200
X-Gm-Features: AcwNN1XWfONgBRIlU-yXy6CPly98fZpO_MCf0GW5eGggOdo-Gs861y_E4L66dCQ
Message-ID: <CAJfpeguuL8He4dKC0+CQU3c=Ss9nDEH=9VckB5mqxOr01X2q4Q@mail.gmail.com>
Subject: Re: [PATCH V12 02/12] famfs: Module operations, fs_context, and mount
To: John Groves <john@groves.net>
Cc: David Hildenbrand <david@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, John Groves <john@jagalactic.com>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	"John Groves (jgroves)" <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ira Weiny <iweiny@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Haren Myneni <haren@linux.ibm.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Gabriel Whigham <gabewhigham@gmail.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Aug 2026 at 23:55, John Groves <john@groves.net> wrote:

> Famfs does work in fuse, but some of the asks are things that I don't see
> how I can agree to. I think Miklos and I should discuss those 1:1, to figure
> out if there is a way forward.
>
> I think the virtual backing-dev thing is a non-starter,

The virtual backing-dev is an abstraction.

Is it sufficient for you if I promise that this is going to do the
same thing as the standalone famfs at the same performance level?

>  and I think that the famfs
> portion of the fuse ABI basically can't live without extents that are
> (daxdev, offset, length).

Sigh.  My proposal was (backing-id, offset, length).  Again this is an
abstraction.  A backing ID can be a daxdev, a striped logical device
or it can be a block dev or even a plain file.

> Also, I'm curious: if you don't know of a use case for the striping code outside
> of famfs, why ask famfs to completely rewrite that?  (and I agree, other
> than the eventual remote possibility of competing 'famfs-ng' fuse servers,
> I don't see much likelihood that this piece will be shared.)

Because the striping feature fits much better into a virtual device
API than the extent mapping API.  This is how striping has worked in
linux for the last 30 years.

> Miklos, I trust that you are a good faith actor, although you seem to be
> spread pretty thin. Can you commit to a series of 1:1 conversations with
> me to try to work through the disconnects?

Fine, let's find a time.

Thanks,
Miklos
