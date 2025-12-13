Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0923EA87
	for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 00:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765587144; cv=none; b=WfWkXdw5sUhiXlL5MN5vgCZWXPe+8Grd03pK22Uvh3iXELBQkIfJK3dGgLYiNzke0s76MoyU1KYQIW6vq6OzpVGLOa8dU6dCVwfjdpQrwqaePu/PcbKBQb7QS2JlDamlxjVYNzz9JVMW93SOIlGgGKZtKCSj5ZwFui12uIJErT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765587144; c=relaxed/simple;
	bh=zvHl18TqNS/KFpnIo9EMp6D5l3sFHcHS5IbPIItY7vE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=LnZqgy4G4G9K9qYv42yl3TQ0d1dNWUd0pohActLmA7Lc4imlRSv3rMoxELJyf49G2jMV/ek10dRG7qHBBljhJdH51lfoBVZQ18KLOMi3Qip1LdyvjMTcbvJWDMNv+kGF8iVh6h7JEXEFxw7kvaqtbj4B+JWJ2vuARXaPRhTrLGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WqQ6k/Jd; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WqQ6k/Jd"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251213005213epoutp0393df5db55a71dddb50fca802ef2c0eff~AoCS71zBo2828728287epoutp03E
	for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 00:52:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251213005213epoutp0393df5db55a71dddb50fca802ef2c0eff~AoCS71zBo2828728287epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765587133;
	bh=H9nShwF5pm8Ty+88PRsF6DJykqNuaXUj1lty7/PLeHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WqQ6k/JdupYwlKlhZnNsaD08DLPqatWfcwlAsj+H28pi0FLYIl6IAXDjZKPZ4v/EK
	 xJFlq3P5RwQ4FdSYZ9D+JNQ2oVt6KZkVW6SPzLVdNmNBMXiTFV0lDLeMXu+XViVShC
	 z/dNoqnbP+OeHTWUTPP6jfRDInGgBfeCrUbNdECM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20251213005213epcas2p30cb93c06c60bd0fd2ab39e4d94881eff~AoCSb66OJ1087410874epcas2p3Q;
	Sat, 13 Dec 2025 00:52:13 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.211]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dSnph4x2Zz6B9m7; Sat, 13 Dec
	2025 00:52:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20251213005211epcas2p3e63a0ea9a163ca2cd57962d5a295c1b5~AoCQoPguj1087510875epcas2p3M;
	Sat, 13 Dec 2025 00:52:11 +0000 (GMT)
Received: from KORCO181097.samsungds.net (unknown [12.80.207.233]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251213005211epsmtip2802bf807a5b6c4f374b4de5cb894ebd5~AoCQjvVN21820018200epsmtip2f;
	Sat, 13 Dec 2025 00:52:11 +0000 (GMT)
Date: Sat, 13 Dec 2025 09:52:10 +0900
From: Bongkyu Kim <bongkyu7.kim@samsung.com>
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	longman@redhat.com, boqun.feng@gmail.com, corbet@lwn.net,
	gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, bongkyu7.kim@samsung.com
Subject: Re: [PATCH v3] locking/rwsem: Reintroduce reader optimistic
 spinning conditionally
Message-ID: <aTy4umirJ8pcHy+V@KORCO181097.samsungds.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANDhNCrz=3Xp=bfydZycPgzr82YVHYk00LeaKSf9dQ5DA1Z5vA@mail.gmail.com>
X-CMS-MailID: 20251213005211epcas2p3e63a0ea9a163ca2cd57962d5a295c1b5
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----10M-ry8nrKNYJjMIkDK3x7sXS9CWutNxtwuX1Fjvo4q6nbOH=_12fd67_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240406081210epcas2p1736b44763ba01114ce3a552aff50d780
References: <CGME20240406081210epcas2p1736b44763ba01114ce3a552aff50d780@epcas2p1.samsung.com>
	<20240406081126.8030-1-bongkyu7.kim@samsung.com>
	<639691db-dec3-e180-3681-00bd966c90a5@samsung.com>
	<CANDhNCrz=3Xp=bfydZycPgzr82YVHYk00LeaKSf9dQ5DA1Z5vA@mail.gmail.com>

------10M-ry8nrKNYJjMIkDK3x7sXS9CWutNxtwuX1Fjvo4q6nbOH=_12fd67_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Hi John,

This patch did not move forward because there were no further replies here.

In addition, the app launch time issue I was experiencing was resolved by
the “Per VMA lock” patch, so the reader optimistic spinning patch is no longer
necessary for app launch time.

Thanks,
Bongkyu

On Thu, Dec 11, 2025 at 04:03:50PM +0900, John Stultz wrote:
> On Mon, Apr 29, 2024 at 8:08 PM Bongkyu Kim <bongkyu7.kim@samsung.com> wrote:
> > On 4/6/24 17:11, Bongkyu Kim wrote:
> > > Reader optimistic spinning is helpful when the reader critical section
> > > is short and there aren't that many readers around. It also improves
> > > the chance that a reader can get the lock as writer optimistic spinning
> > > disproportionally favors writers much more than readers.
> > >
> > > Since commit 617f3ef95177 ("locking/rwsem: Remove reader optimistic
> > > spinning"), reader optimistic spinning was taken out is because of
> > > reader fragmentation especially now that we essentially wake up all the
> > > readers all at once when it is reader's turn to take the read lock.
> > >
> > > But, on smaller systems with just a few CPU cores, reader optimistic
> > > spinning may help performance. So, reintroduce reader optimistic
> > > spinning and enable it when the number of cores in the system <= the
> > > threshold (default set to 8 cores). This threshold can be changed by
> > > "rwsem.rspin_maxcpus" commandline.
> > >
> > > The simple heuristic of skipping optimistic spinning if the lock is
> > > reader owned is kept, reader optimistic spinning won't affect handoff
> > > handling which requires that an unlocker see the lock will be free and
> > > wake up the head of the wait queue.
> ...
> > Hi Longman,
> >
> > I made a new patch as you suggested.
> > I would appreciate if if you could review it.
> 
> Hey Bongkyu,
>   I just wanted to follow up here to see if this patch was abandoned
> or if further discussion elsewhere resulted in it not being
> resubmitted?
> 
> thanks
> -john
> 

------10M-ry8nrKNYJjMIkDK3x7sXS9CWutNxtwuX1Fjvo4q6nbOH=_12fd67_
Content-Type: text/plain; charset="utf-8"


------10M-ry8nrKNYJjMIkDK3x7sXS9CWutNxtwuX1Fjvo4q6nbOH=_12fd67_--
