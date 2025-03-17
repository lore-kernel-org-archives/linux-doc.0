Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444281F3BAC
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742244201; cv=none; b=oQmEYA80fj6a07UyvwHoG14RC1TrAakR8iYNroJ5TVqXjARmm4tsdUdAiCri4h6VctmgRwiBCCb8+bCz1kWWA48QfH3Qq/p5WJSrr/FPgfN3K4RvKeAuQ9KtfB8+KwJj0tqfue+nQ5CEo/rWMst7nvmShv1uE1M717DwxiXiOxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742244201; c=relaxed/simple;
	bh=CaY9plOsZmG+vqb+Y1a/gKRrf/XFzCbAh8Gjy+jCWms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJlcLy2weh20ODAnKaXi1wu9z7s401uiv5zNlVl9RrTw2HSpU+5elDYi70swQau8mPEGIPKX5tnoctqM7oe4PKwhdblxigq/KAtSXorpqrzeu5SnJaiYq+MPEu6ZC1BaVHTt1igOYT+VJC3jV+6/WITBzUTLOSxjy5n5vfztdr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ENDg0ENI; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ENDg0ENI"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-6fee63b9139so40844747b3.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 13:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1742244197; x=1742848997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XMeuqQnVCFYcIh1s8lv0Ab4xH5GnpJ38EIK5c4gPr0c=;
        b=ENDg0ENIuz6Aks1W7JswZhQRnFXeDkSWMoghPY5Xljiy195QJRAQZh40nBJXj8NEEd
         t+sAvoGnQcSbUZBlMdFv6s/I3z36OZdXIVu5zuDrBKEOiP5SqgIt/WxMReR6xg4V/iYB
         INfgpIYEorasNEIay7nMF/n7O9ty+caatL28RaJZ+bB8xjnGClZdn9huEoYAleLZzaPM
         380ClgbkKoEOQ+A1ur/94l3YGPYGZ/FRCRsHV5LA1npPRf5eSh8H+OuzemKl2acsTdzD
         QVj+ytAj7fSpF4ESVcA5OJqkSgwFntEDnPBb2y5pBA/VdM55oASbIPsvMS5T4ejyqrX/
         qgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742244197; x=1742848997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMeuqQnVCFYcIh1s8lv0Ab4xH5GnpJ38EIK5c4gPr0c=;
        b=PZsIUIIolKzSwLUXa6jTjUMEzWK4bhSoGIBSt0fXujYzrIF9JlqRlK78Qd6rs5YIgg
         zHvzzZQhbufg2LuvwhQD1DdHSiOuPm6eIuMgJlHJpLnAMmhEpInLZcTXwGH4awVY95ZV
         Leir26pXo5zKPMShnDMJfEX2XHLHWrU6StO4Uwik3IfUpZDukOMJW/pR8e4NzHIL1h3r
         bh3Il8XbnctR61sDQ/wl0XkGjjoBjEN5HSKy4+kHmHcZ2KhjYghr9/7gWZ+3erYlTBUC
         uuQnNxCxioTlJEGcNq+gwJ5z4LKk/+wEVhp61+upl2REtQzFBDXYu1qRhQS7xUYMURwZ
         GBfA==
X-Forwarded-Encrypted: i=1; AJvYcCWonxl/ZrphPnrWIMGrXEqAWfd1xR4qb2y+NxzYlPL7jVWXsm9FHAabNQGYnHVyy/LNoKkd0m9tKGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPp6w2Na+OaPt3+Sr1q1vB7KHqpYNfuCpU9ThvQ3cMXpNaY+by
	thX7GrFRnj+nUP9NlMN/K3XbR3Cojm0ulyWR2e5hDu1P0WR4WO3+SnkOMcSM/zvQsVBsy7LBs+H
	QxYZB9OIA2ORr1dyEFdJoBAAl9JW1UPio
X-Gm-Gg: ASbGncuz0/2anBO+tUphowA/Q7wKqgsEjMm76cB2e47If/JJRaO7gfFAw35EGf84iCT
	r07WXi7r3OjoILblk56A1zE58ILbZhbeRaFdDxCwBqGIk/tqO3+Qm6eeNQw1pR55zwMVVeOKz2T
	sX52Upf6vtQN5Kzhg737Q4kEdtmoqHo8BurY3okEMWKSZlwrd/TftkzahPCQFX/PQcNTuSGdNKn
	omFNMum7pU+zKjK7FRKOgIMoATJA/mL5wtXAiRK9NRQAx1J39cHiNSJGRkvdcLgWyPl69eNn3fX
	1/GweERZ6AseQipWrtdVldk0uCx7Ca6WJEdVN0N0ONRntnUBUA==
X-Google-Smtp-Source: AGHT+IGhYQOQzoo1W81n7SvjULK8kea4ne4u7SJCVMHMBohbiO+5gVHT5Why/Jb0nEdWm7n7qdstRUUSezbb
X-Received: by 2002:a81:c748:0:b0:6fe:bf32:a427 with SMTP id 00721157ae682-6ffeb390465mr12881107b3.0.1742244197208;
        Mon, 17 Mar 2025 13:43:17 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-6ff32894af3sm4257537b3.37.2025.03.17.13.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 13:43:17 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 3E38A340314;
	Mon, 17 Mar 2025 14:43:16 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 324C6E4020B; Mon, 17 Mar 2025 14:43:16 -0600 (MDT)
Date: Mon, 17 Mar 2025 14:43:16 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] netconsole: allow selection of egress
 interface via MAC address
Message-ID: <Z9iJZBh5ZFq3wC6s@dev-ushankar.dev.purestorage.com>
References: <20250220-netconsole-v5-0-4aeafa71debf@purestorage.com>
 <20250220-netconsole-v5-2-4aeafa71debf@purestorage.com>
 <20250225144035.GY1615191@kernel.org>
 <Z8tS5t+warQdwFTs@dev-ushankar.dev.purestorage.com>
 <20250311111301.GL4159220@kernel.org>
 <20250312203716.110b6677@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312203716.110b6677@kernel.org>

On Wed, Mar 12, 2025 at 08:37:16PM +0100, Jakub Kicinski wrote:
> On Tue, 11 Mar 2025 12:13:01 +0100 Simon Horman wrote:
> > On Fri, Mar 07, 2025 at 01:11:18PM -0700, Uday Shankar wrote:
> > > On Tue, Feb 25, 2025 at 02:40:35PM +0000, Simon Horman wrote:  
> > > > Reviewed-by: Simon Horman <horms@kernel.org>  
> > > 
> > > Hey, since this has gotten quiet for a while, just wanted to confirm
> > > that there's no action needed from my end? Is this in the queue for
> > > net-next?  
> > 
> > It seems that this series has been marked as Changes Requested in
> > patchwork, which may explain the lack of progress. But that designation
> > doesn't seem correct to me. So let's see if this can move this series
> > back into the queue for the maintainers.
> 
> Unclear why the designation was chosen, indeed, but let's get this
> reposted per normal process. The posting is a month old.

Sounds good, I've posted a v6 which is listed at
https://patchwork.kernel.org/project/netdevbpf/list/?series=943246 as
"new" even though it has several reviews from maintainers. Anything else
for me to do?

