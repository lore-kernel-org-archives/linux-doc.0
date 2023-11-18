Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nm3gHz3a"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86E71FF7;
	Sat, 18 Nov 2023 07:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1hYM5k/OHJIzmc6ChT9Yo9Kr+sThyS1yvMvl/d2IeDU=; b=nm3gHz3aDSLq2/llOzW0U+nuKn
	o2SNCFi4rcF7TqLhPDzjkyCehL4mE51lMojstFVeXqTHRP1h2YOzZlP4cDCbn7xhn3a/9TEm6F5qJ
	VkFlZJv8e8E0qeKWJv4aHmvgFm7K9F3EF8b7Lke2vIqCVMYsSOKockkdUeaeaVyIFRK4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r4Nbi-000Vtr-FC; Sat, 18 Nov 2023 16:51:42 +0100
Date: Sat, 18 Nov 2023 16:51:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk, corbet@lwn.net,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/6] net: phy: at803x: add QCA8084 ethernet phy support
Message-ID: <1eb60a08-f095-421a-bec6-96f39db31c09@lunn.ch>
References: <20231118062754.2453-1-quic_luoj@quicinc.com>
 <20231118062754.2453-4-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118062754.2453-4-quic_luoj@quicinc.com>

On Sat, Nov 18, 2023 at 02:27:51PM +0800, Luo Jie wrote:
> Add qca8084 PHY support, which is four-port PHY with maximum
> link capability 2.5G, the features of each port is almost same
> as QCA8081 and slave seed config is not needed.
> 
> Three kind of interface modes supported by qca8084.
> PHY_INTERFACE_MODE_10G_QXGMII, PHY_INTERFACE_MODE_2500BASEX and
> PHY_INTERFACE_MODE_SGMII.

Sorry for joining the conversation late.

I'm trying to get my head around QXGMII. Let me describe what i think
is happening, and then you can correct me....

You have 4 MACs, probably in a switch. The MII interfaces from these
MACs go into a multiplexer, and out comes QXGMII? You then have a
SERDES interface out of the switch and into the PHY package. Inside
the PHY package there is a demultiplexor, giving you four MII
interfaces, one to each PHY in the package.

If you have the PHY SERDES running in 2500BaseX, you have a single
MAC, no mux/demux, and only one PHY is used? The other three are idle.
Same from SGMII?

So the interface mode QXGMII is a property of the package. It is not
really a property of one PHY. Having one PHY using QXGMII and another
SGMII does not work?

     Andrew
