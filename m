Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6DA2D8387
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757926263; cv=none; b=DHWEjZwpcdgU0RQ2zPSRsYaU/ceiVPHXW0IoDbX0KwPs3eCmA8JHF5gmjYRNbMigR7Rj9gXgzopdsvwm8Vp5xTvOxPyoHCvdN18aq+DI4uRR62dO8YZ9nqGJKr+cz/EFdH3yPSdHRWA//jYiDvUwJ44vcSlSDQW1P8oS8KSwWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757926263; c=relaxed/simple;
	bh=wPZPeUMuJZB6mmUn0N0BcQU5xP2lBbhUb5Om7x+1yKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dHPX+meCB4yQ7eqib7kNQOtqQhHqyQlL8/0FLmeDGvZZYfMQxvAtijI+C7wCXlyaeOZ3J8gaKXGgFOuojry9d/pHRSOT5312ebFv2dUES4TYvYvKSE7DxoA6OPGc18VZygXC1btz0dDs7XaJ40kD0YMqfRJxZiAnPY4PnH+LE2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GMD5EhYV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GMD5EhYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757926260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHAiXvx7xZu60Hqr98Fl5/ljjKFjkxjgYFM+bVq7QJ8=;
	b=GMD5EhYVLCSzsu8nfl6dJOfSGgKf9FSE4Wnuz+l7bbPcgI5tXY3wCaiUXyCRBcTPx142p4
	V7vYUHF4BmUAbAB14YaS+6MuSoYZJsl8nGNSnJJv3NLsM9mRDJbL3Mog+HRzPYU+xNw0kP
	Z8TkS/He6heXqhgLez1uClApTTHlL20=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-poxpbo8rOdutcDpPnD8LTA-1; Mon, 15 Sep 2025 04:50:59 -0400
X-MC-Unique: poxpbo8rOdutcDpPnD8LTA-1
X-Mimecast-MFC-AGG-ID: poxpbo8rOdutcDpPnD8LTA_1757926258
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-337e4d53fdbso24019741fa.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 01:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926258; x=1758531058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHAiXvx7xZu60Hqr98Fl5/ljjKFjkxjgYFM+bVq7QJ8=;
        b=t3dZa2HV/KkvBvYRFgz7LImkMaCwLHQN/3GYO5PX2IJa43KhTJKAmOzHEpNAYfbsm5
         9W/NYrZ1gD2yoAJKDOynwNxigU+AJWQUPENFxg0RSoRkVxEJMfDOS70Ajg7PygBiRxdq
         xbobdtmFTaqvGP6OVA+38oN2GiEV2LoP+eVK3VElO8jLRBJGlq+SaB8ORtdS4VehlVSp
         9FXVezqFjqANCiDX7SPTSyLsF1S4ntcv63eWRLN7iTYdl2kpvQo8VAS5QG+9AaXHeHCx
         wm/OkVo9exZmEdvK9Ie+rfjWtKWVV9nEHppWYxyccj4B5fZKDP6JpIpfm4mbv2jjb5pn
         A+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3G3wyXqxZOJAnDqOD7kyIatCxeli6mE4wmLjsbzvuTVblP6Kyth0wmdExAt0wYnMAFOaTqckpD5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwocCnb+XDEanW3nSW7gkdRWKm+y52Cl3Wf9A9hnKbjgEkjUA0O
	6J1XHcdQrRdJLc/6QPnF0jXM2QK0dX9yWJtOVB4i4Z/wh8v/oUb6Q5UVDraSb7hDOuNiMcsyrac
	WiK7708krd+NwlhyvbPLQvC0OIzeeKaMsFdOCxjc8XyZnvma/WzEwEbACFUJ4tXxS/grMjlW43I
	+2d5gJ3cORRq+KsQrANOFVGtKRWaoIGFr3KPd7
X-Gm-Gg: ASbGncvAkLCf3WAAtPnzMz6adIfdhk1bNKk2NfpYLsq5sxZtr18FSK2lNrHGk6cFOW4
	Fgf7wCbrQwoSe9LtTBANnH4tculrGNKlDVHrvPCRJNn/VWsHGDVIynYDsMZol47CIxtgHdm7No7
	hWmwwe0PDkKz7tdnKLnXOemQ==
X-Received: by 2002:a05:651c:4418:20b0:336:d1c3:37a7 with SMTP id 38308e7fff4ca-3513d579c3cmr30012551fa.26.1757926257579;
        Mon, 15 Sep 2025 01:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl0ZUO2JTUZirUwacmY7tp8JOoWQWR66JhMiR7uFGREt2YvznZEpf+Aap5lqTItF9SsIhP1MK0sxbosCwSIes=
X-Received: by 2002:a05:651c:4418:20b0:336:d1c3:37a7 with SMTP id
 38308e7fff4ca-3513d579c3cmr30012451fa.26.1757926257122; Mon, 15 Sep 2025
 01:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911073144.42160-1-linan666@huaweicloud.com>
 <20250911073144.42160-3-linan666@huaweicloud.com> <CALTww2_z7UGXJ+ppYXrkAY8bpVrV9O3z0VfoaTOZtmX1-DXiZA@mail.gmail.com>
 <9041896d-e4f8-c231-e8ea-5d82f8d3b0d2@huaweicloud.com>
In-Reply-To: <9041896d-e4f8-c231-e8ea-5d82f8d3b0d2@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 15 Sep 2025 16:50:45 +0800
X-Gm-Features: AS18NWBaOBbr4paKcZMzxqFFD0Hqf4jhv8wGm06I2UjwMAQ7TTVLejBmju46_1U
Message-ID: <CALTww28y7D32SAeoGgv2HjFJW471AtTD-SG0yxed4ZCJSOCHUw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] md: allow configuring logical_block_size
To: Li Nan <linan666@huaweicloud.com>
Cc: corbet@lwn.net, song@kernel.org, yukuai3@huawei.com, hare@suse.de, 
	martin.petersen@oracle.com, bvanassche@acm.org, filipe.c.maia@gmail.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yangerkun@huawei.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 10:15=E2=80=AFAM Li Nan <linan666@huaweicloud.com> =
wrote:
>
>
>
> =E5=9C=A8 2025/9/15 8:33, Xiao Ni =E5=86=99=E9=81=93:
> > Hi Nan
> >
> > On Thu, Sep 11, 2025 at 3:41=E2=80=AFPM <linan666@huaweicloud.com> wrot=
e:
> >>
> >> From: Li Nan <linan122@huawei.com>
> >>
> >> Previously, raid array used the maximum logical_block_size (LBS) of
> >> all member disks. Adding a larger LBS during disk at runtime could
> >> unexpectedly increase RAID's LBS, risking corruption of existing
> >> partitions.
> >
> > Could you describe more about the problem? It's better to give some
> > test steps that can be used to reproduce this problem.
>
> Thanks for your review. I will add reproducer in the next version.

Thanks.
>
> >>
> >> Simply restricting larger-LBS disks is inflexible. In some scenarios,
> >> only disks with 512 LBS are available currently, but later, disks with
> >> 4k LBS may be added to the array.
> >>
> >> Making LBS configurable is the best way to solve this scenario.
> >> After this patch, the raid will:
> >>    - stores LBS in disk metadata.
> >>    - add a read-write sysfs 'mdX/logical_block_size'.
> >>
> >> Future mdadm should support setting LBS via metadata field during RAID
> >> creation and the new sysfs. Though the kernel allows runtime LBS chang=
es,
> >> users should avoid modifying it after creating partitions or filesyste=
ms
> >> to prevent compatibility issues.
> >
> > Because it only allows setting when creating an array. Can this be
> > done automatically in kernel space?
> >
> > Best Regards
> > Xiao
>
> The kernel defaults LBS to the max among all rdevs. When creating RAID
> with mdadm, if mdadm doesn't set LBS explicitly, how does the kernel
> learn the intended value?
>
> Gunaghao previously submitted a patch related to mdadm:
> https://lore.kernel.org/all/3a9fa346-1041-400d-b954-2119c1ea001c@huawei.c=
om/

Thanks for reminding me about this patch. First I still need to
understand the problem. It may be a difficult thing for a user to
choose the logcial block size. They don't know why they need to
consider this value, right? If we only need a default value, the
kernel space should be the right place?

Regards
Xiao
>
> --
> Thanks,
> Nan
>

