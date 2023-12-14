Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2gnJCC9T"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0107F1739;
	Thu, 14 Dec 2023 02:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hL27dSLqUR1fYhgLcHCRK29mJV+B6pX4R0DXWGJrOn0=; b=2gnJCC9T5+jlLMhkqX26eUrO85
	KLqxuRZRdqOUnpKBZekxZeRlLTtdgC02vjbnujOMcOcgue9OM3oBU+Q6z7wuKxXnFGgpUr8Jd+8eI
	mcdJtGMysMNRJVCW6IDTeSzMfVP7thsXihG/Xw7NGvBrUb0VdQVj9BEXvq/eJofJi8DE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rDjMF-002uic-CV; Thu, 14 Dec 2023 11:54:23 +0100
Date: Thu, 14 Dec 2023 11:54:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk, corbet@lwn.net,
	p.zabel@pengutronix.de, f.fainelli@gmail.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 02/14] dt-bindings: net: ethernet-controller: add
 10g-qxgmii mode
Message-ID: <8472a40e-b114-45bf-b990-69c1224df34c@lunn.ch>
References: <20231214094813.24690-1-quic_luoj@quicinc.com>
 <20231214094813.24690-3-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214094813.24690-3-quic_luoj@quicinc.com>

On Thu, Dec 14, 2023 at 05:48:01PM +0800, Luo Jie wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> Add the new interface mode 10g-qxgmii, which is similar to
> usxgmii but extend to 4 channels to support maximum of 4
> ports with the link speed 10M/100M/1G/2.5G.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
