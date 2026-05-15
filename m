Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5FD3F23B6
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831673; cv=pass; b=Pt5BnaKGS/nV8rLz7d+2UalFu4qwfJbgSy87V2dDkKVWM3Ty1LDYAX3CL95atKIXWmYwIcHzmTNbJJVS+zjZJDDyLscB2iug4VCd+ZzJzbI/qkF41Lc6Q3fYryFtZmLHU7/okwCCM6HrlJXH66Lpm+TjH+ri7byhBeuLKnNwVn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831673; c=relaxed/simple;
	bh=NnAm2n/JLIRCk/X4BzmpX+diOi/39kzF1jC/6tqwOBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMxXVmK9KyS8PfjiTQUHcbchQsV6d5GuqHkyXALNE2i55znze7ozeqPn6kJnddsjBTwd0x88GbAXL3YHMDukH0i0d3wAiiTlmP2tViFFbPCC6qMEQhwyKZ3DRjlhHaoi0RTDAMeby0b83beURqLPTaSUeBaCVD21whzDFxDV+Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfi/62sS; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfi/62sS"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dcc6feccd6so957301a34.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 00:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778831669; cv=none;
        d=google.com; s=arc-20240605;
        b=GuT721A0sQOiZ1av/OvwI6IklSE0DdkfEcNWRueTNWLVJNaGePH5JJO3jxSYGqdVfB
         c+sdPHLhvWUlCxTu9LzEoz202ZLC5QECw3Oz+uZucU/l/KIayVCsi8xJkZy4Jt4OwnBH
         8XOolzkSO4nsqgsSdd2NAbgybs/6MoO7DZTnU2NE0NDEy6PJfdAVzepJpuFtTuO3pnK6
         UsKkupf1Hnl8BOT1WScp/kVAa+stXWg9CFVs7zuawQwKPEuHOaVZpvdiKT/hhmuvtwFg
         ojaDeRn31qefvY3ZCEtXQ2RltxRyinY/ZXpMihtfWspQWOYIDSCsofJ4ISgbLnKEEtTP
         I6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9uW9TqyzWwlmL9J++FVDFaWM/pD85rKSTbODz5Q0CCg=;
        fh=h0rK65mR05HxyJY+Vcwb05z5dbGXpa/BHi06ztd+cMI=;
        b=ESWv+Xqa+qWVfOoJpS3kcfX4OAYZl3IMrKjPP4s3QvCWKbJMSFJVUr8k+h9f6dP1IJ
         mghSigaygz0d0dkToOIk+fLPYD2anDnDXqD4J7dy6Hic5QmT9HHVb2vp/DoTThSdBywX
         /dyumxbK8kNJiH/kPIjVDPbcWG9esfu+yOu1rV+3Ka9QuEpnjR5omEZdVH04tebMcme6
         Y/WC9+p4czdToLMYVGziEgE3BPeqRsF0MOSU859rWrQS3J5z5Ke7w5vEWZvrlKZVo9q4
         0yTuFinLBQKJnDKVqzr5s/nHaaqjJW18fhGfz5ldSURimrCrPEV97paqaWqZAqs9+pk2
         6GRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778831669; x=1779436469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uW9TqyzWwlmL9J++FVDFaWM/pD85rKSTbODz5Q0CCg=;
        b=pfi/62sSDe8NzC1cHrjPV4nbSyjOTZXjo5gVhw/6yPwz4qAMgb2Q7sQUhbFBccpSsZ
         ooBvebfLfVdEs8wMfeZKppakFO4O2eqyMaFjuONpXWz5g4KA9eBZ4iIyiSZ0uXUpF3pY
         WYuxJzUJlv4Eg4DDp6FY+u+qJ9D0W0t39UJT4GMIVEmoqVe0pr8xzVFyyXxVrYOZ6gKd
         51OjKMyoUD4UN+MBz+Xph0T3fCXVX8Nw8rUxN0hM+lXHqE9lIaNF2PsPZW9J0sFz0v9A
         TbI7srv9l6uU84j9tlRldnrsWw1SKceMS9snC8GcVgz1GdswDB+hF82sJOJp+lMP6498
         t7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831669; x=1779436469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9uW9TqyzWwlmL9J++FVDFaWM/pD85rKSTbODz5Q0CCg=;
        b=aJjRC75S97JuzySjqfy5pq9PUtwlVDG9BF1YwF8dBkxBOn+drz/W4q91V2VMkBLcLl
         IV4fbjpuWvnVnbql7CG9KYwkPakaIkZcXxJi5pnl8tq1iS2zB5rMq2+YiOsOukF4LWfY
         pK/gJG8kKUf+jx2Y4GQH7wDizhW316fKbNfOaeanCYG7teJgpKcw2YdsHw28qDDfLOzS
         /t+XEI8NRrS4S+nc9wTILD5x0Q66GoJB4eWHDUJM/NSZaaQ7sRwf3BXyNEqskb8J2JR6
         uM0yOgcH0vm64HBEqo+Ye3NFp4YlH7+tDSc7eMLFO0/JZIPMpI5PU3At5loyX4Crv5lf
         NeHw==
X-Forwarded-Encrypted: i=1; AFNElJ+fpHNPzn84u8x6TiHF+C7b5umkyIMRah+TqaFF3wiirSCzRNN5gvaVzOh59ejaaVTYMSbKRq5TXSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWeKGy8vb5QRchrGWIi1OCU8LRc/NpkF51b5+i+3h83VvUc5JW
	/UeCRJrxpZvt0ADdNo520XCP0Nu9Lny5+jaZmswYamgSQSRYc1Kwy+IKojxlXHCExrxvyqHvZvy
	w7bOhkf01Irfq09c0L1qQQ8YT+LmasjY=
X-Gm-Gg: Acq92OF9rDqMabQhdxFKnBIPj0LJvUMx+sxTJeTzx3IE1fis2tL3qQukjNIRYIhNgfd
	OoaepU7p78oFwBF0YyZrE3ebQWyvNkQJu/nYeqi/NgBC9S7dVbKEptu2kWlK5TIu9E7E5bHoRTw
	Xao/mMqCEVvJ1G0RqYk1lePkO8dZe4Eslnp+LRIcAs3BO4e680wcq/7EB9Y9KKiJUkCGOhZNy77
	XB6yYyU7M9Th2xkBBDbHXebZIIg5xRfqjzgijQyF1/X3gEIJJTu70uQvoOJZlVb5HqBNT5ez0hH
	W+H9J9qp
X-Received: by 2002:a05:6871:2b1b:b0:417:2454:278d with SMTP id
 586e51a60fabf-43a2dd1cf16mr1181750fac.4.1778831669438; Fri, 15 May 2026
 00:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514094955.76305-1-jianlv@ebay.com> <2026051443-exuberant-important-534f@gregkh>
 <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>
 <2026051406-corridor-equation-c50e@gregkh> <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>
 <2026051532-pettiness-gave-1127@gregkh>
In-Reply-To: <2026051532-pettiness-gave-1127@gregkh>
From: Jianlin Lv <iecedge@gmail.com>
Date: Fri, 15 May 2026 15:54:17 +0800
X-Gm-Features: AVHnY4Kopsm-UaM55dghPQ8QvaJfAEgnSvk2X6VP6ZRZrUgv1ir9UpJfD-Z2WB0
Message-ID: <CAFA-uR8Jj+MJaauAeEUoS+OfuudrV8C4mG2we-nd7-Cvofokhw@mail.gmail.com>
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:13=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, May 14, 2026 at 11:09:03PM +0800, Jianlin Lv wrote:
> > On Thu, May 14, 2026 at 9:49=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, May 14, 2026 at 09:35:08PM +0800, Jianlin Lv wrote:
> > > > On Thu, May 14, 2026 at 6:16=E2=80=AFPM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > >
> > > > > On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > > > > > From: Jianlin Lv <iecedge@gmail.com>
> > > > > >
> > > > > > Device drivers that use asynchronous probing can cause non-dete=
rministic
> > > > > > device ordering and naming across reboots. A typical example is=
 storage
> > > > > > drivers (like sd/nvme): asynchronous probing can lead to incons=
istent disk
> > > > > > logical names after reboot. In scenarios where disk naming cons=
istency is
> > > > > > critical, the probe type should be set to synchronous.
> > > > > >
> > > > > > This patch introduces a driver_probe kernel parameter that over=
rides any
> > > > > > driver's hard-coded probe type settings and allows runtime cont=
rol without
> > > > > > requiring kernel recompilation:
> > > > > >
> > > > > >   driver_probe=3DPROBE_TYPE_SYNC,nvme,sd      # Force specific =
drivers sync
> > > > > >   driver_probe=3DPROBE_TYPE_ASYNC,*,usb       # Force all async=
 except usb
> > > > > >   driver_probe=3DPROBE_TYPE_SYNC,*            # Force all drive=
rs synchronous
> > > > > >
> > > > > > The implementation replaces the limited driver_async_probe para=
meter with
> > > > > > a more flexible interface that can force either synchronous or =
asynchronous
> > > > > > probing as needed.
> > > > > >
> > > > > > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > > > > > ---
> > > > > >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> > > > > >  drivers/base/dd.c                             | 71 +++++++++++=
+++-----
> > > > > >  2 files changed, 74 insertions(+), 24 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/=
Documentation/admin-guide/kernel-parameters.txt
> > > > > > index 4d0f545fb3ec..b43a8bd20356 100644
> > > > > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > > > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > > > > @@ -1377,12 +1377,27 @@ Kernel parameters
> > > > > >                       it becomes active and is searched during =
signature
> > > > > >                       verification.
> > > > > >
> > > > > > -     driver_async_probe=3D  [KNL]
> > > > > > -                     List of driver names to be probed asynchr=
onously. *
> > > > > > -                     matches with all driver names. If * is sp=
ecified, the
> > > > > > -                     rest of the listed driver names are those=
 that will NOT
> > > > > > -                     match the *.
> > > > > > -                     Format: <driver_name1>,<driver_name2>...
> > > > >
> > > > > You can not remove an existing user/kernel api, sorry, that is no=
t
> > > > > allowed as you just broke all systems that were relying on this :=
(
> > > > >
> > > > Could you provide more suggestions on how to improve this patch?
> > >
> > > Not really, sorry, I don't think this is a change that should be done=
 at
> > > all.  disk naming is a long-solved issue, to think that you can fix t=
hat
> > > by doing sync/async device probing is not understanding both the issu=
es
> > > involved, and how we solved it already :)
> >
> > Do you mean referencing disks via by-path/by-id?
>
> No, use something that does not change, like filesystem labels or
> serial numbers, or something else that is guaranteed unique.
>
> > In our production env
> > they can also be unstable; this is an example I encountered before:
> > https://lore.kernel.org/all/CAFA-uR_jk6jCmf9DTebSVBRwtoLuXuyvf1Biq+OObq=
RVAOZbBw@mail.gmail.com/
>
> Yes, paths can, and will, change.  Don't use them.
>
> Why not use a UUID, that is explicitly what those are designed for.

For cloud deployment, the local volume provisioner detects
and creates PVs for each local disk on the host, and it cleans up
the disks when they are released.
The local volume provisioner is deployed in the cluster as
DaemonSet.  For the same SKU, it uses a single, unified configuration
file to initialize local disks. In this scenario, UUIDs are not applicable.
In our case, logical names are used to identify the disk.

>
> > I understand that device naming in the kernel can change at any time. H=
owever,
> > Is it necessary to provide an interface that allows users to choose
> > the probe mode themselves?
>
> It's not going to solve your problem, so I wouldn't worry about it.  And
> you can't remove it, although I really would like to :)

OK=EF=BC=8CIs the reason we can=E2=80=99t change the priority of driver_asy=
nc_probe setting that
the original logic has changed, i.e. it would alter the original behavior?

Regards,
Jianlin
>
> thanks,
>
> greg k-h
