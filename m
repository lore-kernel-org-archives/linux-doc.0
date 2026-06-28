Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321BA3ACF0B
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782679317; cv=none; b=dW2+l8WGRU0ScxoZD1h9N6a1oa+NOaw3fOX83PCXYAaO2OLHfsdhfT470CkEyyWFAH3znqH/6ayGGbfvkFbENi9FuK6uOk3mWocvzCdeFeebSm+dMDCgE39uBnWkXCyWtmzxrc8apKQJqzj3LBgaLHK9xSs95yz+Q5p+DJkC8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782679317; c=relaxed/simple;
	bh=j038mUcZjm4sep8U2CON12rveC0DF5YhYcieF8knB5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMUBvSIvlFP/cDAoonuvT0cn3aeKh5qeuNnHS4yPVUdCugZecDeTWsGbmp3PssHuP4laX0dEpIxBVMccXJBRFDS2kALCeVmREKg/MkZv286Fn1xlIR9W6iRAxYmlpKbzCwItm1ZIHOrkp+ZQfnA+NkqA2/Axcp/MD5/NHHspKFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouMvpPmf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouMvpPmf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so7722645e9.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 13:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782679315; x=1783284115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjHbb/zbi5lY1Aux2naQDbYxfNt6M3ms/FuKtgATrAE=;
        b=ouMvpPmfZDeWdnA0zR+StyyfvNvqq2pWlaR3aguERJVMq+jLcR3fgsQss8oJ6iDjTg
         99aLrye0Bbgt5YwqdALjiJA+h/EIq7X3+qd9rpYMiH4xTwZSAzzypqm+XZFSq+GSrJGj
         gpUoRRMTGgbv36svLxbNW50AEfCT/7FmOySduV4tiqHj0aVN5NkPgT8xtu3y+IjUV1Kd
         XgcHN8LQIztle4t6F3680bKTnNV88fLP/dmdoJwAl4KJYNj/NrBIHaHkFCAMVrXdFOF3
         szOAshHMQ0leTWXThWjhOzJoqi6fsxdguTS/951W5RUXDfp6R41CF6PcPmKfmTqT5XWU
         BSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782679315; x=1783284115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjHbb/zbi5lY1Aux2naQDbYxfNt6M3ms/FuKtgATrAE=;
        b=qzq5il5TnuzpTeiKbdjEB419SxqNannTyLRWr2I/xMB0hZ5q24jSkSJgVaDTCM1Q+s
         juK6xav/6ZKfgnU5HBi+5mjGze/AVCl1/x/G/5k43Hm1fsjO9BfOBxkg+NtuoY6yIjWn
         mFm1GYclihObJm53JsdlQt7t+W3WWDFn8RwWI1YjAB0qON2qblhWZ88mHZ2u0stu7ooA
         cS7XXldPzY+v69bfPuHqH2XtNgyB0JtVxMXpWMUmRGoqvSPGkIpCU1+yoLZ60iN/MNgy
         4/BCFJwhjjl2S3NeX5r/f1hXLmm0q1CQXZYnxpwzgnD47cRG46xlu5x9pPY/EHGTbz5s
         z6kQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KZIsEYLVsIQpVjk7LEGxKY3fL+U2007eefxo6sPQMN2aR7CHWcPr3riwwjw8I7GFXfX6HoBcVE6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiw0amtri7bLHMs9xm8W9tINDUUCV5L/wqI5EGMMZ2aBqcigq4
	FXwVZwZSf3llnVYCnKR5/nJ9uMaJnPMR9MRYlwrlF8zGPTpho+FN8zt2
X-Gm-Gg: AfdE7ckntM9D/gYNP8oQmFe7gpiAX3HiLHNom+efNY+ZGDPVnJBwso0Amucegm89onA
	BIjA3FRpQLgWuEss1iWoXdpwTVuIhyuIOcbY9IxJY859CU5QxlreOTqmXUoI6fos8y0uz46bZQu
	MA/t42vz9yVy6VnWNNaoNefZfnZIjhUV2n1Nzc9Y84xTa8XGJFXAYgmhSphJgSul8Q8ENGYAqf9
	MB3CNnaDVRIdcgJBN6WLA3nGiwVoIPGGEWLBgGojRvsI7b4Op8qIVib3YZ+ErCCskMpKY4vBn/q
	OIDrJjo3iiTJ7PJ56ZFukP2eZY1EDIT8rmq74wVqtlzb7GGefIVjXZbSKDJNwp4a3w8v7jn+5lT
	Q6wjHPGeFlIi63pRh6xhsh/Guz4xBQ5bvvZFZN4YDwP08pw4+gzutOk5dqcyQnT2HLC9x3RzVfl
	ztZrTl+/PlZ7CQqk5DUomF5CNQ
X-Received: by 2002:a05:600c:4e88:b0:493:ad8a:e7f2 with SMTP id 5b1f17b1804b1-493ad9a2b29mr18360745e9.13.1782679314528;
        Sun, 28 Jun 2026 13:41:54 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fcee16sm276918785e9.2.2026.06.28.13.41.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 28 Jun 2026 13:41:54 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:41:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <20260628224150.39990d04.michal.pecio@gmail.com>
In-Reply-To: <8f5bb295-fc1b-4698-8f2f-2d40fb4d9f93@rowland.harvard.edu>
References: <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
	<CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
	<5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
	<CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
	<eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
	<CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
	<02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
	<20260628165040.76fd608d.michal.pecio@gmail.com>
	<62e1fab3-1045-41f3-bc74-4c7624011619@rowland.harvard.edu>
	<20260628190201.00afdccf.michal.pecio@gmail.com>
	<8f5bb295-fc1b-4698-8f2f-2d40fb4d9f93@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Jun 2026 15:18:02 -0400, Alan Stern wrote:
> On Sun, Jun 28, 2026 at 07:02:01PM +0200, Michal Pecio wrote:
> > If such devices will exist, then it probably won't matter whether
> > the delay comes after or before the first request. Purpose isn't
> > known, but it appears to be rate limiting configuration descriptor
> > requests or delaying other requests after this function returns.  
> 
> In fact, the commit that talks about the Logitech webcams does
> describe their buggy behavior to some extent.  It says that they seem
> to reply with stale video data instead of the real config
> information, and from there it's a short guess that adding a delay
> gives time for the video pipeline to drain or time out.
> 
> In addition, the fact that the delay is needed after the first
> request but before the second suggests that the data corruption only
> affects transfers longer than 9 bytes -- which the new first request
> would be. Therefore it would be appropriate to have the delay before
> the new first request.  Whether another delay would be needed before
> the second request (if there is one) is unknown.

Fair enough, that's possible, but even in these specific webcams it's
still unclear what delays would be necessary with both quirks. We wait
for the HW to complete something, but we don't know what starts it. If
it's device reset, then b2a542bbb308 has already doubled all delays
so d86db25e53fa6 isn't even necessary anymore. OTOH, if it's the first
config request, then a delay between the requests is mandatory, and
a delay before the first request is useless. If it's something in
between then your approach could be the only viable choice.

I would worry about it when a device is known that uses both quirks.

> Good point.  But I dislike messages that actively produce wrong 
> information.  Nikhil could get rid of the parts of the log messages
> you don't like, but he shouldn't leave them as they are.  He could
> even do that in a second patch, separate from this one.

I can agree that the first "descriptor too short" message becomes
misleading, because we no longer expect 9 bytes exactly, but anything
between 9 and 255. So this could be changed to "requested".

But I see no need to change the second message. Regardless of initial
request length, the next request (if any) asks for the exact size and
we do expect it to produce 'length' bytes.

Using different words in these messages has a beneficial side effect
of making it possible to tell them apart when wTotalLength == 9.

Regards,
Michal
