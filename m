Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA443DFC92
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542073; cv=pass; b=BQZ4pJENc+g4QHs8y9LzsUZUbZCNeASlb3Pa+dCgH/1IPL4qemTXR+t7hI1J/gw6QwbT5Z2MemLE6blmzBPtnvhpxghW1m3EJRfD3m+sz5+h6XfRaMvMJUQIaBfOd3iUe2hEHpykmOgD+JwXARdnGgVQd3fLcrKeIycbrxoC0c0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542073; c=relaxed/simple;
	bh=0rQxBYeUI9kccjQsg7LlbwcyM5KH4xYI/FlafZxUfTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkFT57d9N2XIe7skeEgeIv33YuycDHTUlRigRvwD6LnnUW3spyj1OrTNUU0Ko8EfqXb2ccfHj7k/fnqVIvVy/+xX55OEQp5JXGLv3FPDeOPkc1Ui9EhSawqHhZg7TAKnjDn5MwOq0VDg+wYv+BZkCsSHnZmQ10Ztp3TgKu0jeII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENQQ6fSS; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENQQ6fSS"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1671ec8692so621583766b.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 03:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784542061; cv=none;
        d=google.com; s=arc-20260327;
        b=V+iuhumTd7VR9a2pd/TYSEp4+KX3MaDRaWwZOUuuSFlPIh6fRQeRXx7KtEpsorPz7p
         qMhkwR0V1VDUmQIkmDuvuBz5y4JbucOIHU+6dKzzTDokNMiyYvAlaLRJfzmP//E9A8ke
         9MaMfF5pPcOtOexI8vBEhrgFHO5swU1mFqVqJZvVFd06UX5OotcGOWqA8xydSIOJPdvB
         1n5NJa86ZUrLGw5Hx9Y22QjVAZhMhv9LlYosTR9EmZHay16XuHrlFBBWyLLj6UxCvM+g
         iCWa7QVC6UjCT+kPj+XWrr4N/nviRFXgPXYMbwDtPEaUwn+PNxq3toxi9EWp90JSfTwt
         nxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MCCq1AIeKXMGUk+k9l/Opmj013LJUPQC31Mm1vW63VU=;
        fh=Q2EsmpSLruyhz2tugoSv999dQIGSa5SeAWIKQxDv5NM=;
        b=ibtwczMqixBAfR92IEzhNWSngr6ixgQLeRBZCXwC9RLsW9yXXHfl0OP6WZ9a1ajryP
         jslpHSzeuOf7FeoGtRFQ5cSSjqJLCWhpB0jolD5Z/ILrI7+AGY9TRM3VjRGOcsSG2uq5
         Q8Y0j24IJGtqlNCzhTdVFUZfqx5AnurCvJFttRlLPrws9irMLdTcP+l2jIjbExyWVP4s
         36Z+J7rAjGeDHGOLVMbDZAttzRe8JQ7VzVp7Wa7xNU/OyecilQnJvdtOiqAzEgcfz4zb
         ONjlEVHo7txsVWIvX+pC59T1y7JmrGCHwGlCH89J7kp/soBmFzy42v9cciJ1BoYjsy64
         Adwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542061; x=1785146861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MCCq1AIeKXMGUk+k9l/Opmj013LJUPQC31Mm1vW63VU=;
        b=ENQQ6fSSLVfcUYDy3ip1f4SSQUvz8U8E61dUWzjHQgucda3jPA2Y8U/nZiyn0xnE7f
         tY3a7J4UCv/G43hNNsd/717ArtTfUD82unVWh98UPdYlikdZkRrzGkeDGRZ1ESU5LA54
         MXi2HDdh2mRoFu7p+UC85KdsF2ykfriHUcNHFM9zCIaKAePy0bSr9F3hStnTNzy3gG4C
         SPiQ8eCBdQAB3ndslMuYbKjv3yVcea/ACdz6Mn7y7h2q3XMNRXQZ/Gx/oeSLlL2yS67N
         /ZNVrRHnz/HqEH8xsliVmNKOfUIU8ZKr58s7fmPv04zM+fLMfYSmYeXs8kpDxSxr5awB
         j0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542061; x=1785146861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCCq1AIeKXMGUk+k9l/Opmj013LJUPQC31Mm1vW63VU=;
        b=Z6gqrSnNJlCqAFoBtnlJ/hajPcIT6YqrtI+f0dtCejW6MbVgw+ZL0sWYyPmQB52TZY
         VnjU+RyHrGH9TQWBm/tixe8UaJy7r+hEnxXS4Wwehf3lg4CusfypwE7wwpeCAZboJPuz
         6cew0/+M3qz1KaM+rGJ/mF1E4HbiOvsc8rEHYymvO6SscLLYBBaEZEAXqjo1zGzMwWkt
         tIk3/xAqGAQjQZ8vXkMfz6L40gywMXCXX2Gdpg1VWi1yvPmlt52NUkRpzyJiNhRnz1ef
         Yv/24LAMs6z+4VsnlgJ6asTI2J4Blbx2C8cmgVwHPaEMeofz/F1s7qXZQnOoeBYRbkSE
         pH3w==
X-Forwarded-Encrypted: i=1; AHgh+RrJ7FT0h/3ZGY/Zj7pSp/ggW+z2P8+yobd+/57HjTrLq3M6JoxdzomF9n0z0BiHARGI3CS7CwQNCfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYf9l2YIm1gZ/HiE5DKYky0thZhU3RyZPR7JglPZ6U3nLkKCg5
	UPli83AEYhIIIBp+IWAI9etVTc7MxSZNssSofZUAKnuphYYEJo60RPdV4vXzQ2XO1oiWF/o9uEa
	u50GXsLzAL3QqdWoJPnEbSx3plfybYyg=
X-Gm-Gg: AfdE7ckFnwOs2JKvVdcoKH2Mc7q6cwoK9vXaJ9gwio5F2DzgfyakfEQkbi5sYIADHNy
	E1FUxCa1LF4QQl4/DSyehai2kqzCA0U674cqteRtyRLyUzU3L2qLjovjcVdQf/X8S1EOtttyHx1
	IfivEAx/nAGS35nM20qWBG6W8iMmO1KmEWlGcmJ4NCcdjDp61Voi31f1hCp3n8Q4Ep0A8/Q0dYY
	0E2W6dP9JmmWdh3drxEXm2R0W1rGmC5oCr3xBoxyR5iLnVhYKZQ85qOQc/d7J5RPgW9g2PUOA==
X-Received: by 2002:a05:6938:a087:10b0:c16:7969:12be with SMTP id
 a640c23a62f3a-c16b47c1e4emr338791966b.31.1784542060903; Mon, 20 Jul 2026
 03:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
In-Reply-To: <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 20 Jul 2026 12:07:29 +0200
X-Gm-Features: AUfX_mz15n8tVrhQrtGTVlRLA7H7ya2xjAmCYkRT34S0zyePGJ2_WjcXc9IUx7k
Message-ID: <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: John Groves <john@jagalactic.com>
Cc: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <djbw@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 5:44=E2=80=AFAM John Groves <john@jagalactic.com> w=
rote:
>
> From: John Groves <john@groves.net>
>
> This has been quite a gauntlet so far. Some requests were made but eventu=
ally
> ruled out (e.g. using BPF for fault handling).

I'm sorry John, but this patch set is not what I was hoping to see.
I don't know if we are miscommunicating or if it is something else.
I will try to do my best to explain again.

I say miscommunication when looking at your comment in reply to [1]:
"First, a scope check. This patch touches only the daxdev registration -
GET_FMAP, struct fuse_famfs_fmap_header, and the simple/interleave
extent structs in include/uapi/linux/fuse.h are untouched. I'm reading
that as tacit agreement to GET_FMAP and its ABI. Can you confirm? If so
the large piece is settled and this is really just about how a daxdev
gets registered."

This was a wrong assumption on your part, it was NOT confirmed and
I even responded to it with a mini tantrum.

I feel that you may have not gotten Miklos' second patch [2] at all, becaus=
e
you have not responded to it.
Maybe because it was sent only to your work email?

>
> Concrete requests (demands?) from the fuse community included the followi=
ng:
> - Pass daxdevs into the kernel via an ioctl rather than a new fuse
>   message/response

Look at this patch by Miklos:
[1] https://lore.kernel.org/fuse-devel/20260529134302.1989958-1-mszeredi@re=
dhat.com/

Look more closely at the diffstat:
 7 files changed, 123 insertions(+), 294 deletions(-)

It's not about this ioctl, it's about infrastructure reuse.
It's about the fact that there is NOTHING special about dax_devlist;
and no reason not to manage it via backing_files_map.

The reason you stated was that you want userspace to determine the
daxdev_index/backing_id - fine, no problem - this is why I asked that
you pass it the desired backing_id in the ioctl.
In fact I think that all fuse backing_ids would be better assigned by user =
space
so the extension of padding =3D> backing_id is not unique to famfs.

And the best part is that this request requires no changes to your userspac=
e.
You already bite the bullet and maintain the new/old uapi but changing the
kernel implementation does not require this burden from you, so to be hones=
t
I really don't understand why you did not follow Miklos' suggestion.

> - Lose the famfs interleaved extent format. I have complied with this req=
uest.
>   It makes some things worse, but we'll discuss that later.
>

I am really not aware of a request to lose the interleaved extent format.
How can this patch [2] from Miklos which reimplements this format as a gene=
ric
uapi be mistaken for a request to lose this format?

> There has also been a desire from the fuse community for famfs to use an
> experimental implementation of virtual backing-devs from Darrick. I'm lea=
ving
> this out as a potential future optimization - although Darrick has announ=
ced
> that he (and $employer) intend to abandon that work, so it's not clear wh=
ether
> that will become viable.

Forgive me John, but I am having a hard time following the logic of
this statement.
How are Darrick's future plans about fuse iomap even remotely related?

In this patch Miklos has ALREADY IMPLEMENTED
"striped "virtual" backing devices (idea from Darrick)"
[2] https://lore.kernel.org/linux-fsdevel/20260601152327.2069787-1-mszeredi=
@redhat.com/

An idea does not die when employers change priorities.

The diffstat is also impressive:
 6 files changed, 219 insertions(+), 300 deletions(-)

Especially when considering the fact that the insertions are generic code
that could be useful to fuse passthrough regardless of famfs.

Let me recap the former review requests as I understand them:

1. Use ioctl instead of GET_DAXDEV
2. Use backing files infra for daxdev table
3. Use ioctl instead of GET_FMAP
4. Use backing files infra for fmaps

Request #1 was fulfilled in the v11 patch set.
Other requests were not fulfilled and with no explanation why,
not one that I could find anyway.

Perhaps requests 2-4 were lost in the spam folder and/or lost
in translation, so I will repeat my question from review of [1]:

Are there any other *technical* problems that you can point out
with the patches that Miklos posted (including FUSE_DEV_IOC_STRIPE_OPEN)?

Thanks,
Amir.
