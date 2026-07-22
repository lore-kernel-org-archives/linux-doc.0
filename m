Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47F40F74D
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717232; cv=pass; b=kj7mzdj8GIeChiPvzLj0zgZPpou6NuZqx5NuBdLZr88XE+FYnkz2SitLHCLu+ykEkn01th0D70WO6md/KbIOI6AoGjONLntJm8l8bZjlCoIYAm9vZhOlrprV9auE6KAi/Yzevg7uG457IO+/9+DN3e4i4EQsePgYvjGyY8Hx/kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717232; c=relaxed/simple;
	bh=guAhZjJfEBfSY1xp7Mz+NJHa/zurYwT9YHjF7Gv7gyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy/rIqBixWMMpN1FlYs0bTCezbghIYSDuoIjB0Q5iKgn5LgmcjLdU9Faj/CNG7R0NnuuNaaxqoeYGSPPeacGpvZCg2X58TyVnizGAARho78Z9lRMpyADwn2/UltZpVFVsE7S8+ysQqOSkilYTS7EG0oye9aVwAqrIas8mqBuQyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=WzF0IGAO; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="WzF0IGAO"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e5c9211d2so1107791185a.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 03:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784717229; cv=none;
        d=google.com; s=arc-20260327;
        b=EXhX6wInxWGDoEgKu7X6on5zUzGiy5QEgVagRGEskzjTT+7iLZm/x0/HEZxmFbxjXd
         Tb+FGRmkJzCVOOj7PKacbGb8x4144LfzS8mjwUgUcC/6Lql5YD98e9zfnKXL1ATU/vKu
         r0Y8p0nfvBcMGdjfmI9ocnzWF3MAnGU7Xl8a5GabFqfvgbblNjhYgo+X+6GyKboqHg6T
         NaM2dHqOdKTkCldGiXO3WdPjrqyZdyqMNh+w1aHyOCOur0nZxBJIcBF3YNPNq/yPG1Um
         l75n3enIyoNaa0p1bswZb5C0CyHDNr30MCWynnVDkIGIf1wlAjDT0upYRiU5BhCM55JI
         nyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7RG0U3kjlqqprl+YQXEPz8chW66ssUd6wO7da8Gt0so=;
        fh=jKkn3eN2IL+BiKBilnK8ss1XhmaGErwmPhiwIj9JCWs=;
        b=nLcYgoksXzWkalilSZcPfk7cG0wvyTEXKW5YIFoZCGImDf6zddtk2mg3vpGKsIAKi1
         mpmnOMfFAqczHiMUn/HLzb+JZ5Hks+j7FYAWxPB2o2/xQF5SylLbX+izE1F04uxueeVB
         5UFYltPXlfUpACqKw4Q0H66dJ1+4e0xMln5gcb+1o61pT5ybG2ebRlJSIDES5RsMqMxZ
         gDgwtmNxw4a9W4/u1SUbYDgWdLwL8dqFHmRa5ill1QksWDsaBbNHaUUYnIkzqIr6uhLM
         nAkRhkemelJ4tE3ytqq1VibWALSod7Mm581iubJMJPR6qOlXdgkgW7a8HxSJ8L8gcbpv
         CQQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784717229; x=1785322029; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RG0U3kjlqqprl+YQXEPz8chW66ssUd6wO7da8Gt0so=;
        b=WzF0IGAO8mdfhq9zY44w4C5y2L/qBa3gVWxDXR8IV0PNZdJPpSNBFYMY5Zy1xo+Yts
         pxh19SRJBfAZg7UXoyxxNCoRuWhdiFV+EUPu5TU6JDGsnV0kX0k7br5iJ/D1GUcgganS
         LmLPrKR8ufjbA+A2HHUYQQXuCOnPNlUA3CCWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717229; x=1785322029;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7RG0U3kjlqqprl+YQXEPz8chW66ssUd6wO7da8Gt0so=;
        b=GX8QYuPR7DlRSQ4Y54vA4dDuyJ90h49HCiPkJTjQ6moG/cNq0MzG2g9YJSaBgTUWnr
         fP/fGmtmo7TadG9YNTeliqyk207neFHoseUy8hjNRIX9cl+LWD6wngFL7oU3j4PCKy4W
         +paaitrgjWOtcqxhaBv9yKwfl7Sh+jI+tJn4Saq/WnBsYuTxrZlTA+qk9qwfpkvHcmVb
         Hb3SAUH+VDVRJMVyzEn510XOOJ3mIcApWwWpYOYwNk6nQXZO86vrBl7CoWCuJBNTyS90
         4YEZUWDUXDdmgAo5kRmVwKtwrNFfPLwiwk/MsBD4dYkwa0DrjUbkcQtEhVTbuMFNpvrW
         VirQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8HvabPuezU/y5vCs7TZWZ8rdGA+eEHJSunllCdXmLKXWwakOGdjrUSquQpUznrhPIYbTaFR4k7FY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlTzb1itVH8ZI7QR2WFxrw2VwEQryDBxeMJh5EH/GCM2TdMim3
	7EyZj2r4bMRSL9CfI5cm+kI1th+OITnc++p7N3eaXwl6GXxHKfLdk7Y4t8D07sEWcDy93Wk6NN4
	cK+mSRdcbyZFNEi13faKr+uYlUPa21LzkxzH0zqAn/A==
X-Gm-Gg: AR+sD10Sdmqsr+yN95+wVyVYwc5NW+PM471EJWCLIwBWcJCRXNxjoQf+W96GHN53CzI
	owcUgsvTrCX0F24/ROokJcd3BFzMevTTKMDhwbWza84f1RVcrLRCo8iN4BY4Su4JP88+PCidtTR
	JCv93NMDa/ua5NV4ljkKO01ju8rGFS5q8L06qNUINkQiMv/nX+jbrxYBSyZq/CJd/9VuzeAkkLu
	aPY1bMQKr9c9cwEoD4YmB3ejNb+Kh5o3NphtzjjePuZWP8reJ4S3d2korSGyaOn0/gGbAIGzNMc
	ppj6Lb8xvHqR/mOS6g==
X-Received: by 2002:a05:620a:4608:b0:92e:c118:18b9 with SMTP id
 af79cd13be357-930b43c45a4mr2167343785a.88.1784717229070; Wed, 22 Jul 2026
 03:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
In-Reply-To: <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 Jul 2026 12:46:57 +0200
X-Gm-Features: AUfX_mwdbQYshU7Eh86-5S9-gpZDCDD0EXLkbKHjoCISvWGty4DcFL-X4n78Y2Y
Message-ID: <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Amir Goldstein <amir73il@gmail.com>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
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

On Mon, 20 Jul 2026 at 12:07, Amir Goldstein <amir73il@gmail.com> wrote:

> It's not about this ioctl, it's about infrastructure reuse.
> It's about the fact that there is NOTHING special about dax_devlist;
> and no reason not to manage it via backing_files_map.
>
> The reason you stated was that you want userspace to determine the
> daxdev_index/backing_id - fine, no problem - this is why I asked that
> you pass it the desired backing_id in the ioctl.
> In fact I think that all fuse backing_ids would be better assigned by user space
> so the extension of padding => backing_id is not unique to famfs.

Right, so I suggest to just reuse FUSE_DEV_IOC_BACKING_OPEN and add
two flags: one to enable user supplied backing ID and the other to
indicate that fd refers to DAX device.  The changes to do compared to
the current patchset are quite minimal.

> And the best part is that this request requires no changes to your userspace.
> You already bite the bullet and maintain the new/old uapi but changing the
> kernel implementation does not require this burden from you, so to be honest
> I really don't understand why you did not follow Miklos' suggestion.

Code reuse is also important, but I understand John's position to want
to separate famfs from existing codebase as much as possible.  And
because this is an implementation detail I don't want to make this a
show stopper.  We can easily fix it later.

> > - Lose the famfs interleaved extent format. I have complied with this request.
> >   It makes some things worse, but we'll discuss that later.
> >
>
> I am really not aware of a request to lose the interleaved extent format.
> How can this patch [2] from Miklos which reimplements this format as a generic
> uapi be mistaken for a request to lose this format?

Let's not care.  We can easily add this later if famfs (or any other
use case) decides to want this after all.

Making the initial patchset smaller is win in any case.

> Let me recap the former review requests as I understand them:
>
> 1. Use ioctl instead of GET_DAXDEV

This is done, just need to reuse the existing ioctl instead of add a
new one with the same semantics (okay not true because of the fixed
backing ID extension...)

> 2. Use backing files infra for daxdev table

Leave this later.

> 3. Use ioctl instead of GET_FMAP

Not sure we agreed to use an ioctl for extent mapping.   What we did
agree on was to use a generic interface that doesn't have anything
famfs specific in it.

John, can you please also look at review comments provided by Sashiko?

Thanks,
Miklos
