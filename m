Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1690B3D669B
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243441; cv=pass; b=LnlKgDsZAuuQXcddcrU8p1j77oUOhpZ2ZPRBkCuEbJoUudaHXDMwgSgeYiL1fpXhN+++q9H8KZBFEXXcNPP8kWWjUkVY72Wrv4V0uMNx5YWOCyI5fJOxlNj8ena9FoskB4wBRF8lVFDEKreDg46VU/AWmAUF8rBijjfSlooW+cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243441; c=relaxed/simple;
	bh=zZYtyxzFk/f/aBbXqwafBi1lDEMUVHJlRs1FsBDxTcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHUzuBAL2kf7X2pZpweduiqGBRYVXEx8zHtbdLmlxpUKqzuSO5qohlB/Y2Be+VndtWdeD/LJg+i2R97FZncd6cfEQVi/tM971wYFpCoo2Tz1vPmThG+R8SJyIOZZXBqzI+kgiBLvPl92ABUpdEbj9x1wVlUF5ASe7CdvgmVW4pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=B/Dr3QHk; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="B/Dr3QHk"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506a747448dso51358931cf.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 01:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776243438; cv=none;
        d=google.com; s=arc-20240605;
        b=gNyHrR+MH7ye+lrVqafCoWANIAmqqEXxqBtp0tTQvVYPpit2e14mvl64Seo4FnRVp8
         R70kYlHIqYDPJQnFpxCHNAfZ5YaLV7Ka7Adv9s6tnuJI5INSSnQOvCpX9zCH/8KNPOeM
         cGC2ea0fEBlzaG8Jg+kf4skKfwG+VgwLrOMM0LF5t26jSSvyNaq5WpbibRRmfbkDakAF
         I1TL6vWzTzNDxUU/72Ubtm3o0Il99gnS/YcaNJVMU9rAVo8md5SSv0ynTqu/q2KwAYuB
         JW4cG+vUlTY8L41dVEy1vSEs3oIjaP3gbrn9vCLKFxXcCnNgW7WSM5vtftlvbbwl8Z+Z
         zlqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1K50PrXkHzV3G2hBT2az5kpQZDgGSB8kie6wcwLv364=;
        fh=fJSYObkL0o9XziDK+sEDJyLn4EU6Tve+xMMxaBBMXio=;
        b=WCPTkBmkG0pws+tXkYYShwzvAJOAn7jGVIKrt0tDGw6z2sH1L4ROgpAkG/jECsnMZE
         snxmrQLkgu+gTbXkg8XsQT7lZUD46WmMYqJdAwnGc/areZGywygKmWBmBU2cs1iznTla
         moqVa8bwJrOT1vVwD7TDaIJB3Ss2ImC9FCCdUz6kBxCzbt8p61KRGrtFfDJvHIyKosNa
         7b0GLd/NnQ+5PJvYLmEJGZkWSZJqMssNLL7YybdnYbsrTuVpkbcCOJniLubALTtit4iq
         YwB4dpC66JXNp3DaqYwnOhPJDYiSEOdrDcJSWMU6C8XFLDrdsj/0sLq6ZxnZdOIQYPSX
         QrMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776243438; x=1776848238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1K50PrXkHzV3G2hBT2az5kpQZDgGSB8kie6wcwLv364=;
        b=B/Dr3QHkhbP8XyWnEenix2jN4PnO0K/kbuQBlRBlXGdpkelr5iJwbpHxdRnjSLN4h1
         Pv9ZZYxWSsJclMaKdZLRaJzquEYcgZUTXIbbzcJls1Gyx74A1LrARH5gyeUqZ7MNV5EZ
         wNqh+J3xsfokVCeS3lTt5G3LH1xXmYPpsbt/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243438; x=1776848238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1K50PrXkHzV3G2hBT2az5kpQZDgGSB8kie6wcwLv364=;
        b=btnfieT32Xmt284FWp0MSUhYE5CYaJDfT+gj2aeFHSUw3GRXqfYmjkF5NJEOVCIx8x
         2TLpprEWviAkmS7s3GNCgUOKmn7mEcpRVawb2psKw/gfpEPCIz8MyHQI7MNaOa47x2cm
         1GGwGPP4PQSs1gcsiTI1A2WlSLFShmJnUlExMXVXX6omLw7df0/gsGt12kxZ3hebOXc0
         PV4LTs3egxy0K0GWafy39w3B0j5k9QnJQYh3U4Wpdo2bODkluLW3koDqBfoCtkmW2vFA
         lawtZwSxhFFNGjDAQQkrj6pRXi3CISLRCaTB1xXZ6YqqiF7XxvddSurFxUePj70XPbag
         M1+A==
X-Forwarded-Encrypted: i=1; AFNElJ88u2swZMC395DaQb5yQfJG71jzoj7mLaPpjBR4GwcCQ+1c+zF9bDsIlpdBUTVm7OXRenCuRZW3LkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeceGcwG678uJR/vf1sC8jl1LekJwfVil1RxOo5ovPKM79n1+4
	VCpSUNjVdBHJGERsiHuA/BlRk8JZEWgQ9pkhMdCCGfc66+ZzWOr+mQD9zlgkSD1BsAzkLH+eYvt
	z72PbXIXAfue/MO+O9EQeFTwRLDNheJHdtO/TeqstuA==
X-Gm-Gg: AeBDiesqpo/1w3l6eVv84rb4U7JkMgx2ifW2GIQwB6C7sijTkduU1iXmbZ8gZC/E/Sm
	7dJXrSAAmDyWmf2U5nMPFO6ZP2z2fKwJxks3gbynwhT9Ms4N4zl2JGuA2m+abpeE/xqeNv5m5qP
	lSEF+R+H2yAssTsr1FHrintys6CLXBugZwdl1ETXgkzT/CAaaUhdp5GChTLczYg8B6JjL8bdO9D
	s6G+qILQ7rxVEF6pNdEzBs6x+cmMr7CjhI98EzzFlWPVbfhyAsfOafYUDTRNjJY+zi/rl6Lwf3U
	3NtcJGuccgqw4jte0eXp4EOnqeDSjsaSfFdOe7876tia9b8=
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id
 d75a77b69052e-50dd5adbf6fmr287758411cf.22.1776243437803; Wed, 15 Apr 2026
 01:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0100019d43e5f632-f5862a3e-361c-4b54-a9a6-96c242a8f17a-000000@email.amazonses.com>
 <CAJnrk1ZRTGWjNzkMxS3UkeZMmrpadJDtWKontMx2=d-smXYq=w@mail.gmail.com>
 <adkDq0m5Wt9YhJ8A@groves.net> <38744253-efa3-41c5-a491-b177a4a4c835@bsbernd.com>
 <adlBcwJjLOQDAR65@groves.net> <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
 <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
 <ad4_jFsR951c2Mtn@groves.net> <20260414185740.GA604658@frogsfrogsfrogs>
 <ad7MC5Em4l72nJ6u@groves.net> <20260415001558.GH604658@frogsfrogsfrogs>
In-Reply-To: <20260415001558.GH604658@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 15 Apr 2026 10:57:06 +0200
X-Gm-Features: AQROBzCRCfD21Ej4HAHDpxm8vYkUzgtnq-yub_KzWJ3NjPcdpwmvfwFukwnxXxw
Message-ID: <CAJfpegsEMQTwLP04L-EftdqNJrz2saBnK0Li6iZ9=5iiNa2arg@mail.gmail.com>
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <John@groves.net>, Joanne Koong <joannelkoong@gmail.com>, 
	Bernd Schubert <bernd@bsbernd.com>, John Groves <john@jagalactic.com>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, djbw@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 02:16, Darrick J. Wong <djwong@kernel.org> wrote:

> Oh believe me, I had much angrier things to say elsewhere in 2023-24
> about grueling slowass reviews.  That is, indirectly, why I'm now
> working on /this/ project. :(

I've been there too.  Which is not an excuse to be an unresponsive
maintainer, but that's unfortunately exactly what seems to have
happened.

On the positive side, I really appreciate the energy all of you put
into improving fuse.

Some of the reasons for the lack of progress:

- Fuse has grown, and I don't have a full understanding of it, even
some of the core.  Getting older doesn't help, I'm sure I would've
handled this better 20 years ago.  Currently working on some cleanups,
progress is slow, will post the next batch shortly.  Cleaning it up
helps in multiple ways: a) I get to know the code better, b) adding
new stuff becomes easier.

- The fuse-iomap change is HUGE.  By line count it's some 40% of
current fuse code.  By comparison, when fuse was merged it was
3.5kloc.  It doesn't mean I wouldn't like to have it.  On the
contrary, I think it's a very useful feature and would solve the long
time issue with having a way to mount untrusted fs images with
reasonable performance.

- There's no such problem with famfs, it's relatively small and self
contained and I'd consider it ready (barring any roadblocks on the DAX
side).  But the famfs specific mapping interface is something that I
never did like.  Joanne offered to fix this, and I totally agree with
her that we should not hurriedly add interfaces that will need to be
kept for ever (yes, sometimes even API's are deprecated and removed,
but it's much much more painful).

How can this situation be improved?

A dedicated co-maintainer would definitely help, not sure how it would
work out in the fuse case.  With overlayfs I think it works nicely (at
least that's my impression, not sure what Amir thinks ;)

My experience is that face to face discussions at LSFMM will also help
move things forward.

Hope this helps.

Thanks,
Miklos
