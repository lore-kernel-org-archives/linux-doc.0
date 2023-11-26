Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bZphnMMw"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B432CB;
	Sun, 26 Nov 2023 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lFwfHbim/2vFGOOUw2BBRulKU/qvSJ7bd4ioRytIvOY=; b=bZphnMMwRL8NoGO7bP7d7ax2wZ
	39ZLwMO0xqqwvJB4VZzKNVLoSRiSD9LN5xvEtGv/U7+uo3ddQVIDtiF6RAel4mQmwhFnHqzVYegJS
	bTeyvumF24hZ01lft/xCi0Ov3rtke8QOnerGyscp7EteXScPN9Y1lh5arTKF2SPbjKkM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7IyK-001GHE-3q; Sun, 26 Nov 2023 18:31:08 +0100
Date: Sun, 26 Nov 2023 18:31:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk, corbet@lwn.net,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 3/6] net: phy: at803x: add QCA8084 ethernet phy support
Message-ID: <0b22dd51-417c-436d-87ce-7ebc41185860@lunn.ch>
References: <20231126060732.31764-1-quic_luoj@quicinc.com>
 <20231126060732.31764-4-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126060732.31764-4-quic_luoj@quicinc.com>

> +		/* There are two PCSs available for QCA8084, which support the
> +		 * following interface modes.
> +		 *
> +		 * 1. PHY_INTERFACE_MODE_10G_QXGMII utilizes PCS1 for all
> +		 * available 4 ports, which is for all link speeds.
> +		 *
> +		 * 2. PHY_INTERFACE_MODE_2500BASEX utilizes PCS0 for the
> +		 * fourth port, which is only for the link speed 2500M same
> +		 * as QCA8081.
> +		 *
> +		 * 3. PHY_INTERFACE_MODE_SGMII utilizes PCS0 for the fourth
> +		 * port, which is for the link speed 10M, 100M and 1000M same
> +		 * as QCA8081.
> +		 */

How are these 3 modes configured? I don't see any software
configuration of this in these drivers. Can it only by configured by
strapping?

I think there should be some validation of the phydev->interface
mode. Are ports 1-3 set to PHY_INTERFACE_MODE_10G_QXGMII? Is port 4
interface mode consistent with the strapping?

	  Andrew
