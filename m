Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D919ABD8
	for <linux-doc@vger.kernel.org>; Fri, 15 Aug 2025 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755221899; cv=none; b=qte0GEqyQxH/p+KiAI79zW3w8hzQ7YOctlutndxVRVT527Esh90rFjx/syjXLydZzBeIRg94xs891zlMYEQT1T0DXkiWEgkYwT3WG58VMkrNWcPxkKeKvw7vD2DcMxzDr+AfWVlWwMbTBOuBuUIT2Aosvw/q41a9I3Ja4TIYs6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755221899; c=relaxed/simple;
	bh=W49tmC8pMPCmtFcn3qEiXKG1KBDWgCmX4g9K7vu18jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UY9KmuJog1z/KaYz0sAEsMXb+GaHiTaL0ZCkbPMk5Ht00X0VMNlGJKSr0d6dLZCX8DG8zq+ShntmuPZ7Z9JAhdcULxz6MoxuNaREQA85eQ4uKsPv8gGPrpERVjDwG5sJFRpeF0jF3NSp/WOOm+9UbJ6p0q2TAzJs2kaJcHn3Nik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com; spf=pass smtp.mailfrom=mucse.com; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz8t1755221820tf5699c30
X-QQ-Originating-IP: tlNQ7+NHEjaXcRky/Tvj9nySe0eW04M+BZV9Y0tdcD4=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 15 Aug 2025 09:36:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9320296151560598808
Date: Fri, 15 Aug 2025 09:36:58 +0800
From: Yibo Dong <dong100@mucse.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
	gur.stavi@huawei.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
	danishanwar@ti.com, lee@trager.us, gongfan1@huawei.com,
	lorenzo@kernel.org, geert+renesas@glider.be,
	Parthiban.Veerasooran@microchip.com, lukas.bulwahn@redhat.com,
	alexanderduyck@fb.com, richardcochran@gmail.com,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] net: rnpgbe: Add basic mbx_fw support
Message-ID: <AC9522804BA5F115+20250815013658.GB1129045@nic-Precision-5820-Tower>
References: <20250812093937.882045-1-dong100@mucse.com>
 <20250812093937.882045-5-dong100@mucse.com>
 <eafb8874-a7a3-4028-a4ad-d71fc5689813@linux.dev>
 <9A6132D78B40DAFD+20250813095214.GA979548@nic-Precision-5820-Tower>
 <9af5710c-e465-4e21-8705-4698e544c649@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9af5710c-e465-4e21-8705-4698e544c649@lunn.ch>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:mucse.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MAMW4dxoxFyt4QS9Wrwt6Bb6c+QKJAOHnLKYhEZOuqjRf1o+uhsnFaZj
	Dw7eGNHWknnrsy89Dr8/wTZKcYJCDrw0G2MAMRW4Rev8kukKnLQawf0ChKsriXTWZY61ZpB
	Hh2Apn3HBZREESAKq4J5Ch18NH8ARWQQI5m1Y6ORTFxdwR7u5spaUUpx463137nS9YEnND4
	0qYs5MTMjOMJ9RuKb9T5DamHrfM8DwfzLnDRsqGDGyQlYkuxdH1s7FXIZ8eUIikOdXDfXNa
	8ljnjwzKWZOCv0NwtCYffZiyt8OrvUhw7TqgYgzbIiNpZrHT12NYA4Ynom8DN4gkSMAjzw3
	lLcGMq5Qt4fatHmbNESDlfWaXX2++jPCKlfUjJGduaNVJELKFaRzoX6RfqfJ99m6n7U06FW
	Miv2zfu9jXZUBx7ayNe/AcCUJjPkaTbWQ62FBRMty73eGIP+UwLQo+9kZ26mT8aoMvwTH7K
	a3BMLDnG3IPXZ4ZtlIJlCx5YKJ6zEoJ2eU6yZDqDBJH20xRLPPGysI6HBHwtylx3E55dr+0
	WwjBMeMtwTxmIHIOQpQukFL7uMlET3tR14D4YTyOKAHj2Ty/x0QMtyJcNJRH7tPlmO0Ib2F
	ikE7UAkT9Ih5Pdm1vVPWMKKlo1uALcjjBh0f/r+MH/UjmScy8U+2w6wnSP5tRpaCSulWKaN
	CjYCE0dw6C6vQeYb57/thfEDZWWnbcTrlx5ZTctISHwoXFzLTNCuRj8G0elgrVF/DnR0VHU
	zO/nJEPNgiYBaWe9JjR2802NzB3h8LcE/ZOr7dJlk3/txQ5ebYLmru7ZsljQ71gKyANDW1j
	6Y6exdJsAceh3ebnFQiN2Ubxl6zGiqrHNOTwKiWfF5uOUUOetTbM9vgpa03U98hwmQXlyyi
	y6wVkzGghaYx7iMSK/kMjSyCA5z/abDpWfMPrE4iLHyI7qLFLqzH6Tt6XMcN7dTdco7ZKel
	5eSP6RaoaFNHGw5kf3U3SmHgYTGBNQbHqocL3v7h+WBbBxEs+nILeUJymcYgcAxygDhbIL6
	269xUjvKKzRkTXGCTn
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Fri, Aug 15, 2025 at 02:04:57AM +0200, Andrew Lunn wrote:
> > If it is more cleaner bellow?
> > 
> > static int mucse_fw_send_cmd_wait(struct mucse_hw *hw,
> >                                   struct mbx_fw_cmd_req *req,
> >                                   struct mbx_fw_cmd_reply *reply)
> > {
> >         int len = le16_to_cpu(req->datalen) + MBX_REQ_HDR_LEN;
> >         int retry_cnt = 3;
> >         int err;
> > 
> >         err = mutex_lock_interruptible(&hw->mbx.lock);
> >         if (err)
> >                 return err;
> >         err = hw->mbx.ops->write_posted(hw, (u32 *)req,
> >                                         L_WD(len));
> >         if (err)
> >                 goto quit;
> >         do {
> >                 err = hw->mbx.ops->read_posted(hw, (u32 *)reply,
> >                                                L_WD(sizeof(*reply)));
> >                 if (err)
> >                         goto quit;
> >         } while (--retry_cnt >= 0 && reply->opcode != req->opcode);
> > 
> >         mutex_unlock(&hw->mbx.lock);
> >         if (retry_cnt < 0)
> >                 return -ETIMEDOUT;
> >         if (reply->error_code)
> >                 return -EIO;
> >         return 0;
> > quit:
> >         mutex_unlock(&hw->mbx.lock);
> >         return err;
> > }
> 
> You might want a read a few other drivers in mailine. Look at the
> naming. I doubt you will find many using "quit" for a label. "out" or
> "unlock" is more popular.
> 
> When it comes to locks, it is better to have one lock statement and
> one unlock statement. It then becomes easy to see all paths lead to
> the unlock.
> 
> 	Andrew
> 

Got it, I will change label 'quit' to 'out'.
And I will try to keep 'one lock statement and one unlock statement'
principle in mind.

Thanks for your feedback.

