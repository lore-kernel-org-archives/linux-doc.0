Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CF925D558
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 01:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755741257; cv=none; b=apHt/YcNS0NtUn8A8g4dGrHgJrB6kSHSxlBxWbNAIqDEOkYGGPZQgrwrR/TgQ5mlqJIj+NDYnWfGnUZ12qlWds3ZiCpUgBaoEa1mp8guaoTHTD4RrjvCCLH61mDFbt8uKDGBJmYxdX0oTnPqAGLdoqiLzoPtxVB5UqA7XsPkbBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755741257; c=relaxed/simple;
	bh=cx5YUdGMO0svEm7a/UadbxDXZqCmBpAVHoAU3bdhdGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OERcDMf56xjxdjzTL69v0+uXkNHHNuvHUC++sEV3iaBu7DefUT0nXD8vUIuSOvSTst4rdOqGkpqW7F7WhcGWWFtuKX1HVsyodqzKjraV3SYqMESfx0z+TKhGsJ3Rqq7r/j2FvtGTtDapix/IoB48PNRnL6paO9zFK/zHRmspK4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com; spf=pass smtp.mailfrom=mucse.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpsz19t1755741186t3b5f08ce
X-QQ-Originating-IP: jz3qN019iMHA861p4VQp21bgDluXpW5XD56RTS7CiPM=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Aug 2025 09:53:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13122141616914188234
Date: Thu, 21 Aug 2025 09:53:05 +0800
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
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/5] net: rnpgbe: Add n500/n210 chip support
Message-ID: <4E76D5F5691FF908+20250821015305.GC1742451@nic-Precision-5820-Tower>
References: <20250818112856.1446278-1-dong100@mucse.com>
 <20250818112856.1446278-3-dong100@mucse.com>
 <d4a84d76-8982-4a9d-a383-2e2d4d66550a@linux.dev>
 <78DD9702C797EEA1+20250820014341.GA1580474@nic-Precision-5820-Tower>
 <77d89708-19a1-4394-bd6b-ca5aef6bafc1@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77d89708-19a1-4394-bd6b-ca5aef6bafc1@lunn.ch>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M/ESU50hZOEXWjd3/4pEFfpt8B9lq/ehTHB6OCCsevturPRJJ8NJ6I0m
	kHmfbNtjptnIGldIZNh1MB4ifwUstXpzEYGHzMEWjWmNYCuJ7kQn044hNl1HOrxXFsfQI7r
	kFRWMGRhSV1NFILkaFN2sK6rR0JKcDhW7UsepXe6zL3ZO5s66/SUqr0OEnXttN18o5WF+Xm
	ZHpFplDzLwyN/glbhGL0plfjSYnVaImgvRE/dU9JxgrpcpboDEqpeAsdCnbpppXy8qXlbya
	THhLc+FSqfv3NnSV3ukLCAA2BMqTVVxNThHlVStRnsI8zcBZW8gW4h/K37QNo9wgJ6+XPPW
	5CO2Y/1SLnPz1WogxRUXJOLKiZXGbDFfDuYC38dEOWknyjZgu2TOiwGMVYgddthXlKxNv84
	ZR1wIJmjkM2isM8vfBwFXbDqTdBlcqfa5imzs8jKICb+BmxhUBoza0xdL930nE0HCAyXpdz
	WaGuJkHi4NTTLzRQS4RocnBz1xNnhZONH3IRFokBSyRrVkAFNeFKMYo0JlcSy6S4rEfGlFk
	09hJCx65mik1iQjOuS6DhzBNKdPxXRjXSjzXOGqnimmQeNBXhproAaUgZyyhiXa87j8WkfX
	o7npJeFyw6SBWVxX/MyWbdMgsFaWU7tO5Cwi/Naf9+Tx8OorktU3zYfiPO5On3oGAGxEtac
	jOchwgJwb8+EvZw3kB3vsWj4Yiz0UkR2mt4ASUlyrg4u4ilhifsKwwLLFY6FTXr6YyBLBG2
	IkG4L57na7PMWwbACCznHjksXtAf5eIAPPKGKN4L5abrQZQyAbIDZnq5O+9GfuKbEK6iakb
	5DrGaSlLh8OK/xTpFVpWdFbt7Eu6xKK2zTOTxMrN92X2rrNZP/Aa3v1pZaYSSmYr+hH2fyp
	NRGiMEAUjthFELVBkY6TLl3eTSormthS/FaKZjm5LO7e0i5I9S5VQ3YmPuaKs5N1xSKoPse
	STB9htJbXmEUWs7y4Bz9K/ly2SNkngjcOe0Cdf7WQD73/pEVaxl28OPBeJ56UP1hhnqfU/h
	+qk/l+koCwnlGft/eI0zueTNedknE=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Wed, Aug 20, 2025 at 10:10:00PM +0200, Andrew Lunn wrote:
> On Wed, Aug 20, 2025 at 09:43:41AM +0800, Yibo Dong wrote:
> > On Tue, Aug 19, 2025 at 02:59:09PM +0100, Vadim Fedorenko wrote:
> > > On 18/08/2025 12:28, Dong Yibo wrote:
> > > > Initialize n500/n210 chip bar resource map and
> > > > dma, eth, mbx ... info for future use.
> > > > 
> > > [...]
> > > 
> > > > +struct mucse_hw {
> > > > +	void __iomem *hw_addr;
> > > > +	void __iomem *ring_msix_base;
> > > > +	struct pci_dev *pdev;
> > > > +	enum rnpgbe_hw_type hw_type;
> > > > +	struct mucse_dma_info dma;
> > > > +	struct mucse_eth_info eth;
> > > > +	struct mucse_mac_info mac;
> > > > +	struct mucse_mbx_info mbx;
> > > > +	u32 usecstocount;
> > > 
> > > What is this field for? You don't use it anywhere in the patchset apart
> > > from initialization. Maybe it's better to introduce it once it's used?
> > > Together with the defines of values for this field...
> > > 
> > 
> > It is used to store chip frequency which is used to calculate values
> > related to 'delay register' in the future. I will improve this.
> 
> Maybe also see if you can find a better name. count is rather
> vague. Count of what?
> 
> 	Andrew
> 

Chip use clock cycle not us(microsecond) to achieve timing. If chip is 125MHz,
driver setups a register to 125 to get 1us timing(125 * 10^6 * 10^(-6)). 
Maybe usecstocycle better?

Thanks for your feedback.

