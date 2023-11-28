Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="whC9yfCx"
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66ED2138;
	Tue, 28 Nov 2023 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Kqd0ZZyXT9nJQi9dwXBehSCo6NOmmyqnNaiHd+uCVU=; b=whC9yfCx0Udo9iFHwXHWMOFPVR
	V5pix6ulLuyYpHr+vYNyG5y5shQMv5R56u/HNcczCtE12sF417Sh5VoAau4XYBvP0ucOKbg+cBHGY
	skbfXPYP+CDqWw3kHXC7uK/b+gcwsV7YjmeGv/th7SdJnMW7aSQAf3+0fU+5hcindJuh+Ogh4WWVa
	XEgCpz3IU8sANK+HWysINamznqtYNEEsT9zCxnc0ypRQ+aqWtVHMza67VPg2b25bHLPQA4u6WbNh6
	c1LaLqoqViolzvrgpCaTyQHSYKtevKB6iSLJEgcHZ56MoXMq5OsbFxJZdzLD3Qs7kLTrFenybszgR
	ngb0hEJg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39606)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r7txG-0006zt-20;
	Tue, 28 Nov 2023 09:00:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r7txF-0002oc-FO; Tue, 28 Nov 2023 09:00:29 +0000
Date: Tue, 28 Nov 2023 09:00:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, corbet@lwn.net, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 3/6] net: phy: at803x: add QCA8084 ethernet phy support
Message-ID: <ZWWsLf/w82N0vwBq@shell.armlinux.org.uk>
References: <20231126060732.31764-1-quic_luoj@quicinc.com>
 <20231126060732.31764-4-quic_luoj@quicinc.com>
 <0b22dd51-417c-436d-87ce-7ebc41185860@lunn.ch>
 <f0604c25-87a7-497a-8884-7a779ee7a2f5@quicinc.com>
 <8e4046dd-813c-4766-83fb-c54a700caf31@lunn.ch>
 <9c4c1fe7-5d71-4bb2-8b92-f4e9a136e93d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c4c1fe7-5d71-4bb2-8b92-f4e9a136e93d@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Nov 28, 2023 at 03:16:45PM +0800, Jie Luo wrote:
> > > The interface mode is passed in the .config_init, which is configured
> > > by the PCS driver, the hardware register is located in the PCS, this
> > > driver will be pushed later.
> > 
> > Is this the same as how the syqca807x works? Can the PCS driver be
> > shared by these two drivers?
> 
> I am not sure syqca807x, would you point me the code path of this driver?
> 
> > 
> > What i don't like at the moment is that we have two driver
> > developments going on at once for hardware which seems very similar,
> > but no apparent cooperation?
> > 
> > 	Andrew
> 
> The PCS of qca8084 is the PHY PCS, which should be new PCS driver,
> in the previous chips, we don't have this kind of PHY PCS.

No. PCS drivers are for MAC-side PCS drivers, not PHY-side PCS drivers.

                     +-------------
		     |     PHY
MAC---PCS --- link --- PCS --- ...
       ^             |  ^
       |	     +--|----------
  For this PCS          |
                  Not for this PCS

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
