Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="VLP+pfvd"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 863A71A1;
	Sat, 18 Nov 2023 12:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SjXWAYmFEc1rO45Mv1FCK3wC/fa6+5kmEE0zIU9kiS0=; b=VLP+pfvdw1d3r5xTGcSD0PaueI
	fRcAAr7XA7s+pc4BUmgqQDuhNbefPXcsMgi+BixYwYq/TQY7uZ6ZZyfBYw0XOj/et2KfurHfzYDXa
	vFJrZg5IX99IXX5Gs3NS/pKMSgKajnXaQpRB1icjMs+NwQwAb5YezfZlmeZFj2S9y+OA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r4Rn2-000WiP-4j; Sat, 18 Nov 2023 21:19:40 +0100
Date: Sat, 18 Nov 2023 21:19:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Luo Jie <quic_luoj@quicinc.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, hkallweit1@gmail.com, corbet@lwn.net,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/6] net: phy: at803x: add QCA8084 ethernet phy support
Message-ID: <eee39816-b0b8-475c-aa4a-8500ba488a29@lunn.ch>
References: <20231118062754.2453-1-quic_luoj@quicinc.com>
 <20231118062754.2453-4-quic_luoj@quicinc.com>
 <1eb60a08-f095-421a-bec6-96f39db31c09@lunn.ch>
 <ZVkRkhMHWcAR37fW@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVkRkhMHWcAR37fW@shell.armlinux.org.uk>

> 10G_QXGMII is defined in the Cisco USXGMII multi-port document as one
> of several possibilities for a USXGMII-M link. The Cisco document can
> be a little confusing beause it states that 10G_QXGMII supports 10M,
> 100M, 1G and 2.5G, and then only talks about a 10G and 100M/1G MAC.
> 
> For 10G_QXGMII, there are 4 MAC interfaces. These are connected to a
> rate "adaption" through symbol replication block, and then on to a
> clause 49 PCS block.
> 
> There is then a port MUX and framing block, followed by the PMA
> serdes which communicates with the remote end over a single pair of
> transmit/receive serdes lines.
> 
> Each interface also has its own clause 37 autoneg block.
> 
> So, for an interface to operate in SGMII mode, it would have to be
> muxed to a different path before being presented to the USXGMII-M
> block since each interface does not have its own external data lane
> - thus that's out of scope of USXGMII-M as documented by Cisco.

Hi Russell

I think it helps.

Where i'm having trouble is deciding if this is actually an interface
mode. Interface mode is a per PHY property. Where as it seems
10G_QXGMII is a property of the USXGMII-M link? Should we be
representing the package with 4 PHYs in it, and specify the package
has a PMA which is using 10G_QXGMII over USXGMII-M? The PHY interface
mode is then internal? Its just the link between the PHY and the MUX?

By saying the interface mode is 10G_QXGMII and not describing the PMA
mode, are we setting ourselves up for problems in the future? Could
there be a PMA interface which could carry different PHY interface
modes?

If we decide we do want to use 10G_QXGMII as an interface made, i
think the driver should be doing some validation. If asked to do
anything else, it should return -EINVAL.

And i don't yet understand how it can also do 1000BaseX and 2500BaseX
and SGMII?

    Andrew
