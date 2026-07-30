Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1EE3C09E9
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 20:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785445170; cv=pass; b=C0I+2dMuNBoPW0Ej9S4kVx6i/5az35qvyrZLKJ7fIEqpWoR9hteC4BiJUi65ukJcXQuKHR7zSDUUKFCosxJ1Mjvc9iUs3JFDDK/LcWrzB6T38bhpT3eNVS8hCzm9fho0O7sO5rCjlPW5QlAp/rEKEqLatYfyaQptCrpooiHKWtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785445170; c=relaxed/simple;
	bh=TjfWFjcumtGogPzfLKW4RhkCh9Rhh17DgLYBpsrtvDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5gRv1Ei2PfPrJ12qambXyCpPAPetr0oTfRkH2+M38Q2WSA2LornTEkSopxfCYNpTxJP05pMDMQJq/hWyZN76/6yIXsJDF8kWokJUarh5inzeAo8uERkGLaAeRIxV8Hna6/zhCFsZyZ2wK2nOxe0jApsUp4X4XiaC55aw1Kf/1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6ME+3Hp; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6ME+3Hp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49550ec592cso7807635e9.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 13:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785445166; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7ghAc1w0ewqKEEpvOvaYkGPQldWOgClHiT6AW7sKgzQ6KRueOV8UZaXZJIKBfJE7V
         la5R7eKtxTYVkcjvU/TeOWxeiK39SPPjuebNMgUZBLlodK07VdB29VSPBV0UCi755vK7
         RWQL+IJkppAgUGMar+V6pqEn8nvaHJTEBZhIm4+nw0Qq8rAK5ZUpJeIU6vApTJ+jaGUf
         d6LdINY7rvbK5Pl4rXEOnI9JwmGPj+4PGq0QO9ap7jKS6rWs57r/OjHMAcbl2tuvp3Gi
         ORUfQbcNtUhmNppQHlFEW68XByZEiT0iFZJn1u/lHwMJMEpTCsQ/WsivKJ3+AWcj/svR
         cvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TjfWFjcumtGogPzfLKW4RhkCh9Rhh17DgLYBpsrtvDg=;
        fh=hLqBlHik4m02L64HbUXc3fOmH3ZjSOjGO7/s6OPaYUg=;
        b=Eh4WPEkafNxFZ/tJ4Y+NMl13g3MebnhzJWyKbOwNfH8tF1HWUIm7+9/sWMbaHxNHm5
         Ra4ta36V/1KwzbFJPx/DKANj6rXmAKAg6sMZfL11bVp+mMlQbexdrbYHP7yLd+KYJ0uE
         IOnVw0HLgTWywVlUt3s7rjaeMgU/6SRyT0Q7yrGjbXl8NnP945o30ekqO5VQrh4V0kb9
         QAcbWE9ukzUwRn48doHVRaQJffaJT97qk+r36Si8cwETy9yk864jRpGP+n6XhOL6qLfj
         SPaPnsS3hJCMfZpbieHoK0bteNKTL0g3X0C8fNCya3vErSlk3Y/E+lZTy2bPLP0jeh3H
         3h8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785445166; x=1786049966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TjfWFjcumtGogPzfLKW4RhkCh9Rhh17DgLYBpsrtvDg=;
        b=R6ME+3HpvtKodB5vMz0HHdPy/tumwxk9eembr/QeHJJMiqq+apXcoGz7XZc43ETGd7
         O8NIVDm2Uxanw1UE2eD+0O6cByz3cIg34hczcsHbkvyM4zMxOkRF+fp7e6HFxiNdCyqF
         mlDU0nwiZkucLp2N0Mksf4zxO7W904kuFt8Dk8kGpRmilj+cy3+4PHQh1OhUMuGiFXjH
         LVPVUCNwrKaIJpSsIFW7XOikTaCgZK6wmtyrpJOGyMzx7KefmrsTEXonBIYS7Z+D6ogI
         lFvfmp6EKz8kYmHwGulCC68bCuCe8OV5dmzEtsXeIYAn2CF5fWeClCLjySPRlu4hEX9r
         mr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785445166; x=1786049966;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjfWFjcumtGogPzfLKW4RhkCh9Rhh17DgLYBpsrtvDg=;
        b=No4wvhoac90nC7xbwoS8hOQSQF+mRzFgC4In/vezTOhvyxEl1XFbs2IcdAk9hQilcz
         XszXOCHznpWshULq1B7YSAj06LE3yC/sfvxaQQz4DnL1onAXnbyyxgiIhD0jU/TawrZ2
         /Q3Bj/wWHHng+DUwn4QXCFamFmj0poJjqB7Kno2L4fZPBk/+Xdz9d9r40MAj9XTb7ZMu
         bZkObhewhsUm+dqVpIXYsabil6bSRKnDLDkLK+CMeKoJmBBw3kYkS3dxdMK3VlPYFULf
         Xmk81B5uBovudjq8YwUg+ra0IH8OG3JquJ6OsVPOR4RS/Uoej3aIL1dzHDXQd5O4V1+w
         7G8g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8LVvo+soEAEJSZa93kcoE3WxDDcorGYqvX3tSkJoUW7LmC+2pCOQ7mUs+Nkjv7WFlna+rJpltMQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC8GcuVs59fuv8vAqQZSh3mbluzkDh71FPtBjLzxuPHuQXKifo
	uLRDITk886LGR1+k15vamjMzQhDHYl1gLLAJyugglF43B0q2fyKmsSf7u0HRPT+ARaHuOz358X/
	acjNR+QbvbR7QVL2zf1bB2SQPb2VMgeI=
X-Gm-Gg: AR+sD1376UymaUTDXkX/mQdqWdw4KJ8IEXr+0Aj3xRyNe6bGimCSC6XhYAqNu0UAUEN
	4g9ekGaf5Vu2zpRs5m6FZa7BlXCfMgnQQ8/hgFDtNzb4o7ePCcVFMhvdfeGg0T/6Ahzk9VEnJdH
	mFYJN/Y6OTQn4N78vvxPCtwz8CORkIhin7fyj7d3eHRi4GR2GThtUFT9OcM/6utdYbedjnWzFAw
	Rf/zWRyjehG6dtr4Uxc+2qHL/0A872+hftfV4u61UpAPs3SzNJzrxQ8yKM0nSA8NZzT/Qv1B4gk
	nqj5uMnuQMAE538NbWUgVkUk5NDhzgKvL0mMGj4C20875D4mXrmHDIWatgvuXm3WUNuLvt89C0w
	CFtpnCqTF5EdkXhKAh0BRjT0c
X-Received: by 2002:a05:600c:5641:b0:495:50b6:5a6d with SMTP id
 5b1f17b1804b1-49804c4cc7bmr22571485e9.12.1785445166339; Thu, 30 Jul 2026
 13:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
 <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
 <CAJnrk1Yat+SEr=SmZXwUt9y2WcC0VEC4KUpPrkrRSjMEmx42WQ@mail.gmail.com>
 <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com> <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
In-Reply-To: <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 30 Jul 2026 13:59:14 -0700
X-Gm-Features: AUfX_myiGnqGNN965xypoyGuHF_KvdnF6l6Z1HdJgtyCUEVPa6_UpbiR6bYul1c
Message-ID: <CAJnrk1aj4B-T14SMTZhst2XsjOkKWStUj_0cjwHswgYWWuaB4w@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <john@jagalactic.com>, 
	John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 1:23=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> As I understand it, the merge window for 7.3 closes at the end of
> August. Just to summarize, the only things needed to get this into 7.3
> (besides addressing the Sashiko comments) are:
> a) replace FUSE_GET_FMAP with FUSE_NOTIFY_EXTENT_MAP (will also be
> good for famfs in general, saves an extra context switch)
> b) remove FUSE_DEV_IOC_DAXDEV_OPEN and reuse existing
> FUSE_DEV_IOC_BACKING_OPEN (logic for this already supplied in Miklos's
> patch in [1])
> c) remove "config FUSE_FAMFS_DAX"
> d) remove FUSE_DAX_FMAP capability (not 100% sure about this, but
> since the only thing added to the uapi is a new notif type, seems fine
> to exclude this cap flag)
>

John, is your intention still to get this into 7.3 through fuse? If so
and if you're pressed for time, I'm happy to take on the items as
follow-up patches to your series, if that would be helpful.

Thanks,
Joanne
