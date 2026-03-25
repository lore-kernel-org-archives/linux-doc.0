Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1D73E8666
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451193; cv=none; b=lurczGqb4QiK+yzB9G60qd5JnMwaZ5YXnGHg8zg+vTCJ7jAvGueq58K8ITqIt1enw/beEIW6L3qbYqmxg7n3Tcu1RP/H7P0KKLb1vz4RSex2YKaDDWu72dWKYi1hUhPFqAW221oYxJaHP8enwagLAW4Y9DEy4y2mNOOu55NxKEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451193; c=relaxed/simple;
	bh=hueUun48O4250wdQs94dWOVmghwrQOiUb0g955DTCkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfHZCzu9gidiQtG27zDBQl1h5XH3se4DI1CpX5MPRgdVQ+7P83h0/sKuFVJk+NGCzSGFbsow00QmECJNX5wY/ceyoBPSORtSwBLdlp++Hwz0AUL6MmMDRPsMpybUZCMcOTQzOpD7htEZJzyadgxvoW8jn5m0V7YSK8zlfswds0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxsBW043; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxsBW043"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c160308a54so932727eec.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774451190; x=1775055990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/d4Gn1kS5MGurytQaHUUdFFZv/IQSTbByU+x/UA/BgI=;
        b=bxsBW043Y5w/Dz8Y7N/NIiibrY68N4RdaHozWOv+rAlIeRZyuQqI2cujs3ZfRtTMCc
         RCO+i4urjzpZM9YVvNvg6cbNOBhzrhgQcFqq3CrLCxR3IgjvqUcRIT5b8kIF403L0dcc
         05XD9q5JXZ5kRRBn6vQrz65dzfz9pavFtAAHKGiBYlFkMsZpeRR1dvTUfY/QMEYoYqKx
         F2frc57Z8FHTlkTPdVhlzcwIu0/beNFkPhyYMJFNfqZq0qO2OTI2d9KFYnYFCsWUfCrG
         WO5HKQKePtf+5mhwrbLyOd+0aDHDhmsWogVgXOPCmo65kTvjM+FdYcqFdd8OKuxTUHbX
         wyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451190; x=1775055990;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d4Gn1kS5MGurytQaHUUdFFZv/IQSTbByU+x/UA/BgI=;
        b=Qk9SifsJ+hKRPWbnS6pFZHPGYSRJkgOFFNQrh1rjmRXvpaccBz1nE0lvk0fUWg1uEE
         kftMLgiaKceZPMXiaRLnZkmWSpjEeFatS+jBR8KemEej/UyaYOXWjfIia7c41r+3Cyw6
         ihU9lXqQGmh1ToLYJuyHp2IfS/E6HyHPQZtaryhE/zsEiPf4qlxXfa4iTLbjyNwhfmnZ
         YB9gYeT/4g27buAGxcSeWc08oodwU8ZVLk10zkWRsBUk8eYJPfnmYahORp29kz3aTXas
         UIbaidyyCD38HOQWXgsTLsjQl7Lph6aPWplCi2tF8sptWctfe7hnLLD+FeAsPwlYZBVG
         L09w==
X-Forwarded-Encrypted: i=1; AJvYcCVXeltcI72mY/i0m06GG2JHFzyfr7JVHZQFMBRfUxvr9JmdoKK9iwg+jI4lpewYC8p3afF6TM3QKtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3+kFHFTRWGTkzQdwWvrzK7WTYKjtX0Bwxm2hb0DqG/FmivkuK
	ATmsiVzKSyUXkzIwhUUf8M6SxRSpe4lanx/bVZEQddz/9mR3Al9yXQc=
X-Gm-Gg: ATEYQzxWMuG1pN3F3hFHJzW1syXLq1GpbK2dlhazc+IpTV9VnKbVElZVzDJsuWy1rGy
	XZBc7HzKxFHU6DaCDkhFw0h2JjPBUXC2XQ8gCEDCk2tuM8Ws5p+EC/4XIdSRw7Rz0F4lcsSI+ZA
	GOnJZDAWgYMNrL7VQcGAKCxENUhUqBkBJgd/oJ+Z6IRIyJ9zB2bJI/d+u5W3nIF3PZ900uYQPvl
	CTHGtLNS+GFjkgrN1ZXwiCPBUzZ6V9ZCeeCaEo4M//JPciXuREUesj4SnFHG6l6jy9xbyDMtSgB
	9whFABSNu3zdpSFSUzMgZ/w/K1B7X+QjHAW7Kjfe2rJZWNfx2Fk+3mWhzf7HAZOFWSWZbEAqrnS
	/9uiIwJzS46/0AZAfX0Vg8RIs91cyYTaJAwFaiYRnyU4N14FGVDD3oMcVdc+eZYofBDEgh9o38e
	nmLQKOMo/vNndTEwE41L625+kIV2i8r9uhqmoS2i19sKu3z7G5fJrKvoyiXyYd+0Q0uiMjCQKAw
	eOFZcSDST51xt01Bg==
X-Received: by 2002:a05:7022:6984:b0:128:ca6f:adf0 with SMTP id a92af1059eb24-12a96e69cffmr1941893c88.17.1774451190214;
        Wed, 25 Mar 2026 08:06:30 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7248731sm29001c88.4.2026.03.25.08.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:06:29 -0700 (PDT)
Date: Wed, 25 Mar 2026 08:06:28 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: Re: [PATCH net-next v3 03/13] net: introduce ndo_set_rx_mode_async
 and dev_rx_mode_work
Message-ID: <acP59NM6HZhV9oAe@mini-arch>
Mail-Followup-To: Stanislav Fomichev <stfomichev@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org,
	leon@kernel.org
References: <20260320012501.2033548-1-sdf@fomichev.me>
 <20260320012501.2033548-4-sdf@fomichev.me>
 <20260323162003.0d155055@kernel.org>
 <acLUMN1BYkIVyOk8@mini-arch>
 <20260324142114.216fcb01@kernel.org>
 <acMU93XN02PHmAGi@mini-arch>
 <20260324204440.1752423d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324204440.1752423d@kernel.org>

On 03/24, Jakub Kicinski wrote:
> On Tue, 24 Mar 2026 15:49:27 -0700 Stanislav Fomichev wrote:
> > > > Not sure why cancel+release, maybe you're thinking about the unregister
> > > > path? This is rtnl_unlock -> netdev_run_todo -> __rtnl_unlock + some
> > > > extras.
> > > > 
> > > > And the flush is here to plumb the addresses to the real devices
> > > > before we return to the callers. Mostly because of the following
> > > > things we have in the tests:
> > > > 
> > > > # TEST: team cleanup mode lacp                                        [FAIL]
> > > > #       macvlan unicast address not found on a slave
> > > > 
> > > > Can you explain a bit more on the suggestion?  
> > > 
> > > Oh, I thought it's here for unregister! Feels like it'd be cleaner to
> > > add the flush in dev_*c_add() and friends? How hard would it be to
> > > identify the callers in atomic context?  
> > 
> > Not sure we can do it in dev_xc_add because it runs under rtnl :-(
> > I currently do flush in netdev_run_todo because that's the place that
> > doesn't hold rtnl. Otherwise flush will get stuck because the work
> > handler grabs it...
> 
> I was thinking of something a'la linkwatch. We can "steal" / "flush"
> the pending work inline. I guess linkwatch is a major source of races
> over the years...
>
> Does the macvlan + team problem still happens with the current
> implementation minus the flush? We are only flushing once so only
> pushing the addresses thru one layer of async callbacks.

Yes, it does happen consistently when I remove the flush. It also
happens with my internal v4, so I need to look again at what's going on.
Not sure whether it's my internal regression or I was just sloppy/lucky
(since you're correct in pointing out that we flush only once).

Before I went down the workqueue route, I had a simple
net_todo_list-like approach: `list_add_tail` on enqueue and
`while(!list_empty) run_work()` on rtnl_unlock. This had a nice properly of
tracking re-submissions (by checking whether the device's list_head is
linked into the list or not) and it was relatively easy to do the
recursive flush. Let me try get back to this approach and see whether
it solves the flush? Not sure what wq buys us at this point.
