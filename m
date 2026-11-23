Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457114;
	b=jN4ZWMNZBNRC1NYYRz+QyaWzbJraXoUs8yvkUYIwb6Wb7KcNRp9gEWkWjAofA3r5ftrf
	 rv9CUrdZf7UnJGy5pH1Oh2Kryw1tnIMVFVcf+v2GXmiOZ5OAW2rVUSmwMMIQ3Ir6SfpTi
	 x4/iuGdM0aKKUReKE1TiJ0GfjmJYeAlYo0m4M/XlB7bJqhaDoOPfM1rgnjaQ6picso+Yx
	 PNfBj4AcNW2mYyFRSUPwwVpwHNJzdwgajNkhpDqwEyDcPFvl8F5s+PIqgnFseLXJo3grn
	 O80j4hDio+/lUcXl104lQndtiivEa/6O+Aw+o8Z7W88jURLEjT+AX4AUmmcTLdQevGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
	b=rN6AsyO6XJDoJP30vqWiejj1DgZhc4vzJ2pWkxYw/VFKWDgybuiALBkcbzplMy4KqcxA
	 TJCowEempGKtpgVaWBzpLkqT2xTNWJ1wADSbsXX2cuhyqDyh1aOBUUx+SQ71T0W72QlgB
	 8SviVyomdSvIZFrRNt+FobfEKGpsCK3+98XwcA4uN+GbI6Oy3miwEiP30aVqnb5Q4PU3u
	 T6Kl+9amanyXwa1ux7xaD6Eu3UTjHc9scWAOmhzrvIkpIGJ5F5hH9hBcakyvN5eRzQfk2
	 UKPzNETAke6ERBx1sG9/yTJrDwX1gm9P4PvRcr2sKF39CFfpIml6wpHH+WfXbZezRDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hpz7Nbsq;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216F606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 18:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1216F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hpz7Nbsq
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1534538a91.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457113; x=1796061913; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
        b=Hpz7NbsqTvn0QO5IqNcw2feT0b821er6TLvP0tMHcFy2s2RO6h4B7KLuBx9vHKKEMt
         XPi6d6slnuO8vHJclR0sIh0igUwY7Pdl9ZfFMeRGeZ+SvSE+1WBVrZ400kCw5Z+IxexD
         ijdL8ud41qDsI9X0qsGhnz6Qm9/0rexBUBtv+7iJcGW9UzZtPZCGmIjXKz2prQYhk6XR
         QZYEi8i3PriRVOjedHIZ1YmV6WPywJAE3bZm+QBa2Wc/KgmPHGNDGB7JyWU0inbohZ+m
         BUfKSka2ZXco7wmR+wHT+2mVB6yowLRmwFmM9Jb/9bI4Fh/IeRxophzoWqOqwKaJLb1h
         U0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457113; x=1796061913;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
        b=N4REmKs2dPG3AFFSeyqvxyoXiwOYzPAgO82am6ms3qzHBFqaSOngePR3dCAmNP75cV
         zw8BEV/63brRT3nPl2yoBGQ8Ttgjc+hsNY4hqy0nizolp/+awbUui+nrD+R9gRqGng6Q
         V/gn0rJrgHngo+QR5fwTCxFTrCk17Zpd0Si3r7bBdlNBMTANjna66kNnbmjhidb5/kr1
         m1N7TMLb0NnAjDasHSTJDaYf+D6DaqY/FFtXltYHqEBgA1Be4H3IG6OavP1k+JZREv10
         WG6PWWXShHblm+/97iKcVfwkwz85LbNNU8DTfIKxaNyVvwTjXPVShvfMx5zHfIOd0O9Z
         7KpA==
X-Forwarded-Encrypted: i=1; AL+hErGhXhMo5DPJDA1rYXcv+8wytl2edoqpSou/FAz5Nn2KDTpFTXAjdoL6J9AUXvRl4f35+VjDTe8FRVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z97BhCEjaqSC/0i9Ym1qES47qg2bvZbpOl2Oekgu1Fk3fCeu43U
	tOmWA0Q9m2JB28EGf4h6san2zdLPX8PGlr0z3HpbXa98RzyDHRxyAgnClT+D8lo2iw==
X-Gm-Gg: AZFdTZeq0DyuPiI4IoyA3zOQU6do3gH39gDSo3zjeGkKPhg5R6gTHEkelPbfGLJT/Yl
	VQz9cxmlmvthl1tcENaFfmbmS2jaospK1sqXGjcy7zUF/D0FuB6YSnfnDK1z+2zhC31uadicPeF
	ScquuB8PaC9SDhtp3r5LCzemjYwue/z2mGi6Q4QnwPi+fcXA9Fjh5waReyDXHQOBXljnjp7UbfZ
	5lk08qTnTq6rj/SS/CLFBZZBF64YoylJm+LGZbJjKsd6HvT4OhQPnUdV6J/bek51FAia3zycpjE
	EZAPIbJQ1ODoAclRt2M8bLkGzjZ5yfzH/Vy70erFEmvt/KJGpAM0Eiqf2zQNKA7FsVrZCREkT0f
	6D8Q/fLccUx1M3vQueCN5M353la9R9e2JSoR+N5a3v+2PHNAK+Sp85TruhX02gqALbWevl/DH3q
	KUigm3ILtFfA7nWo80ejR74d7U+rHou+hzLw4L4+QKFrDqN4NqvqrdxgwFXxn7VuJ6V8gRZm8VF
	KpFb8c61H52EE6Ybof1n67/b9auPjMdNLFniSTb4JDQ0+08FZu5/0hDVcTMTgR3Al+z1dKwqW/Q
	2Kz6KKPINXqNEQ3HjZalLWWnWLwFy1FnvuL/OHv5Leo8a05UKSaNnHnlr7tTouGo
X-Received: by 2002:a17:90b:1d4d:b0:3b4:ca86:8bc4 with SMTP id 98e67ed59e1d1-3b4ca868c1emr225054a91.46.1795457112373;
        Mon, 23 Nov 2026 10:05:12 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm18802720a91.8.2026.11.23.10.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:05:11 -0800 (PST)
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
Date: Mon, 23 Nov 2026 10:05:11 -0800
Message-Id: <DN2SFE0VTWYZ.30XIXLSZ0OQAQ@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Christian Brauner"
 <brauner@kernel.org>
Cc: "David Matlack" <dmatlack@google.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>, "Alexander Graf"
 <graf@amazon.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 08/19] liveupdate: Let file handlers retrieve into an
 existing file
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-9-dmatlack@google.com>
 <20261120-gedulden-rausgeflogen-spruch-cea76174d5e2@brauner>
 <2vxz7bi73fby.fsf@kernel.org>
In-Reply-To: <2vxz7bi73fby.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:36 AM PST, Pratyush Yadav wrote:
> On Fri, Nov 20 2026, Christian Brauner wrote:
>
>> One thing: Please just install a new fd like for every other retrieve.
>> I think it's pretty meaningless to return the fd number the userspace
>> just passed to the ioctl.
>>
>> The fd number is also not useful as it's not tied to anything. The shmem
>> handler looks the fd up once and LUO keeps a reference to the struct
>> file:
>>
>> 	CLASS(fd, target)(arg->fd);
>> 	[...]
>> 	args->file =3D get_file(file);
>> 	args->fd =3D arg->fd;
>>
>> Which means, another thread can close() that fd or dup2() something else
>> over it before the ioctl returns and the fd you hand back refers to a
>> different file fucking over the caller (shared fdtable etc pp).
>>
>> That also gets rid of @fd in struct liveupdate_file_op_args and the
>> special case in luo_session_retrieve_fd(). And a retrieve into an
>> existing file then behaves exactly like retrieving the token again.
>
> I suggested this approach because I found it odd to return a FD that
> userspace already asked us to retrieve into. Any sane userspace would
> just end up closing one of the two. I didn't think of this race though.
> I reckon we could return -1 in the FD that LUO returns, and let
> userspace use the FD it already has to work around this. If userspace
> wants to close the FD in the meantime, that's their problem. They don't
> get the file they asked for.
>
> While I like this more, it's not a super strong preference. So if you
> still insist on having a new FD, that's fine too I suppose.

Thanks both. I'll go back to installing a new fd in v5, like for any
other retrieve.
