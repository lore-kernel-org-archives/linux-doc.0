Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EBA51354E
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 16:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786415; cv=none; b=C94Sr9TSgUa57FeY3pH1du8GpM2goVMvHjGNTHK3vYtVgi17k35yWRYKkOrEb7TB3qlvavqjFxZMseZ1tsXAUFiYc4RQXBCl0KGwX+xgsxgVjwAguLAFW1i4jucWZxnUVNU2QKkrYguFf5ECR3KDOz4YCJ+o97mkWf4gVeJjMY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786415; c=relaxed/simple;
	bh=0+haRPFJVrIBg/KxwiST0BnLw4HTvHOw2SUsjkpxatI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdTuKk4A4eTu7Br7rXpP5Jt/DdhbW9zbRybJjrbdFwSJsRmNRs5oqNUTtRtUF2nqU84nGO3nwlIxwaDstOXBcvzmqZQz8nnfh6+S38LJJ8P/7VtsJL1ScEAhPYA+ND7LYnJD6lvmCyXlgLBhe77K0AIZlQzXNxt9Defh5Qtl32Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kcs1rX9q; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kcs1rX9q"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e849c5fe49so3515106b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 09:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790786412; x=1791391212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFw9xlTGc6nwfYyMIGcXU1qXmiqHTAyDTwnu+eltMIw=;
        b=Kcs1rX9qKBKCm+6gagzO8Lbu9K7Zy4G9PDbcK7BNsB9zcCOPlXZpgU6/Zwox8LSU/a
         BculvFb5O6BRfAdI++hc4Fep465OVJcm84XaIduMIGwpqx2DElkyymTVGrqPVOa9CUxR
         FQfZ0NixeTIBZhOVUk6D5pWc0iHbqYcIHDns9BJOvrsRkTdk0Z7sBkQeRmuvik5fD4Vn
         R8q9P6Bkv7nJ7eoyjptK5YwDYW9ghxndav8tWMDMiD6pv3JGjZB4jvqX+UtuF9QZVMnk
         Hl49fHGSiMe+We+fwXJQ/awSyB+tsjn68HY0L00QH8ZmcLOUCpQkQkM7x6nSgdm/QA9b
         LqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786412; x=1791391212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFw9xlTGc6nwfYyMIGcXU1qXmiqHTAyDTwnu+eltMIw=;
        b=C8so5KKbx34+WoGI4KSPrO9At3bfgAGTxf+7VbwT5o25XdLWRC4136ILgrr1nPc2vH
         ea6t+lujzr0rBlxILv1so3jhf1/FiBBrzd3UqUgxaxu9oLa3zd0CSHo9fUdg0AhRhTkX
         mEdgZ7UI4eXx+WBegedCbpT4snzixWBiZwrXgtjn6rNT5R9ROL77gj7YrjyCf6mARRTN
         RvDmOyzuM1Xw/aAHWl++D+12MtDRZuZ24M92zLHvuKKyXgt8jn9or7bhjo65m1EKa+WT
         ohL/cIATKKaFuhBtfQKYokg9tjB1j9hgoRg8PZpj4R8L4uqVBcMLXRan9mwKuMkIXDpn
         vCAg==
X-Forwarded-Encrypted: i=1; AKwUvBzp8w7nhGuE4BqxrP4QWw81PBjvVotPt3d7Jbx+RjFwM9h7/EIwt2b+AEkwEyIva5I6g/LEXQvaW4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kGeDjmOx2IHCjMFk7mbTMCZNOAVzaeqQcOvk2TTX122bxf/yir
	VOSvn8IBt3UGYzswYbAp/EF0aQUuL/CBpYkAyqOAhF3X+hz7OyllHRa8
X-Gm-Gg: AYBFou0UxjHwojklPshRxoU0x8SUXplkveQWU1WKjxACSXIR1QIEdiSfF3yCZs2AZRc
	SD4s2+FhTR/nCWbUOtrM1ewLGAAUEWbKzorvMoDL2oSATev31Q96DX8u0+7PcKIg12Da2WEc60X
	3J+3tOVfXSQZ7S6annsxJY9JVgSrEuxsDjdgg1RhrlFTxqnATn1ZgdOYWM469skjggj6nE2vSBs
	QIxwUBFj8JsqOSifXj/8tiPsSTGuBp0qy0KAhlPrQUEaYXbFk/Abyyf5hvUniXpo4/hv4vjD5Yw
	WSIzUkslR/Tj4hulKJ3bjvq4KRRvbf0xzmegqkzi/LPIloDlnl5/tPFMDbKt2+7EIQuDSTrClkG
	cjr1a+6AsXj+2FiNVQ0qu/wDu3zg9E6uQYmHoQcOPBbEungj8KxxC8iAY83cufi9mTe3yIVa+nY
	1D1xm7FX1xBc9g10HwCHmzErXmNlfOuhAUsQEgC6df7xi7Qf6nKUrDkM0hzOWnilBLH3Tu54gHY
	kv1LZkvC7ESs1i1u9TMz2bzkonVsx7H7gDBXlhKhXacGfJ+fEH8zweXxG6JQLysWhAEHZChr+ob
	ag8=
X-Received: by 2002:a05:6808:4488:b0:4c3:9892:96e1 with SMTP id 5614622812f47-4f1b84ca716mr1997644b6e.25.1790786412075;
        Wed, 30 Sep 2026 09:40:12 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f1b43a602csm1272690b6e.6.2026.09.30.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:40:11 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:40:04 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/9] ublk: fix dispatch to canceled io commands
Message-ID: <ar07ZKeb-j2ykXxg@fedora-laptop>
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
 <arvOwDHOgvpVW86j@fedora-laptop>
 <e15d4e3c39e8ed1860b762cfd8e43c92.josef@toxicpanda.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e15d4e3c39e8ed1860b762cfd8e43c92.josef@toxicpanda.com>

On Wed, Sep 30, 2026 at 02:17:31PM +0000, Josef Bacik wrote:
> On Tue, Sep 29, 2026 at 09:44:16AM -0500, Ming Lei wrote:
> > It looks two races: STOP_DEV vs. START_DEV, STOP_DEV vs. FETCH.
> >
> > Looks fast io path shouldn't be touched for fixing the races.
> >
> > >   2. A partial FETCH round whose task exits, once another task
> > >      completes the round.
> > >   3. During recovery, the task of a queue which is ready already
> > >      exiting before the last queue is ready.
> >
> > 2 and 3 could be solved in single simpler patch by making use of the
> > ub->canceling flag, and it is easier for backport.
> 
> Agreed, yours is much simpler, and keeping the flag set for the whole
> FETCH round is the right model. I ran it on top of for-next (d70609a2f68c)
> with KASAN and lockdep through my reproducers and the ublk selftests. The
> oopses for 2 and 3 are gone, and recover_01-04, batch_01-03, generic_17,
> stress_01/02/05 and 60 batch QUIESCE_DEV/recover cycles pass.
> 
> What's left for 2 and 3 is that the device still comes up. For 2,
> START_DEV returns 0 and the new disk fails every request. For 3,
> END_USER_RECOVERY returns 0, the device is LIVE, and every read on the
> queue whose task exited sits requeued forever, since the queue stays
> canceling and nothing kicks the requeue list. With ub->canceling
> covering the whole round that's a small check: return -ENODEV from
> START_DEV and END_USER_RECOVERY when ub->canceling is set, checked under
> cancel_mutex against publishing ub->ub_disk. The server can't fetch
> those commands again anyway. Patch 9 of my series did that on the old
> model, I'll redo it on top of yours.
> 
> For 1, your patch alone still oopses in ublk_queue_rq() from the
> partition scan when START_DEV follows STOP_DEV, same as before. I'll
> respin my series as just that, on top of your patch and without touching
> the commit path: STOP_DEV marks the queues canceling and takes the
> fetched commands under ub->mutex, and FETCH marks its command cancelable
> before it publishes it, so a cancel from the control path never
> completes a command io_uring doesn't have on its cancelable list yet.
> 
> For your patch:
> 
> Tested-by: Josef Bacik <josef@toxicpanda.com>

Thanks for the test!

For STOP_DEV related races with STOP_DEV, START_DEV and FETCH, one simple
idea is to add internal device state of UB_STATE_STOPPING, which is set
in ublk_stop_dev() in case of any pending uring_cmd, and cleared in
ublk_reset_ch_dev() when the char dev is closed.

Then we can fail STOP_DEV, START_DEV and FETCH if UB_STATE_STOPPING is set.

I have written patches towards this direction, so far so good, pass all
selftests and survive in races of your reports, will post out for review
further.


Thanks,
Ming
