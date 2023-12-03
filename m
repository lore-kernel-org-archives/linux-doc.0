Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nNkCBi1d"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB764E8;
	Sun,  3 Dec 2023 10:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3WBhCpBWX37N5cjsNg5ZZZtJtBisSM0dTRcPh0wLMNg=; b=nNkCBi1dmJQaCQreznDoIHAM7M
	to2LbakVF7BzVfPaFkiceQOIYt7M97/8rXDzKlfs7dlR4YGmWtuvhv/G6Vl6OHlGM3q0Tmhqf65W6
	3Fbp8LMQ+Dqhq+gzxn9MVRhBhyaPCvQbh/JATVqV1WYZDvzWG4H8+CkVkdpYqzTIN/sw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r9rSw-001uSE-4o; Sun, 03 Dec 2023 19:45:18 +0100
Date: Sun, 3 Dec 2023 19:45:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	Dent Project <dentproject@linuxfoundation.org>
Subject: Re: [PATCH net-next v2 4/8] net: ethtool: pse-pd: Expand pse
 commands with the PSE PoE interface
Message-ID: <e0b143dc-ca7e-4762-bd0b-3acffad0932b@lunn.ch>
References: <20231201-feature_poe-v2-0-56d8cac607fa@bootlin.com>
 <20231201-feature_poe-v2-4-56d8cac607fa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201-feature_poe-v2-4-56d8cac607fa@bootlin.com>

> @@ -143,6 +150,43 @@ ethnl_set_pse(struct ethnl_req_info *req_info, struct genl_info *info)
>  		return -EOPNOTSUPP;
>  	}
>  
> +	if (!tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL] &&
> +	    !tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL])
> +		return 0;

-EINVAL? Is there a real use case for not passing either of them?

> +
> +	if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL] &&
> +	    !(pse_get_types(phydev->psec) & PSE_PODL)) {
> +		NL_SET_ERR_MSG_ATTR(info->extack,
> +				    tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL],
> +				    "setting PSE PoDL admin control not supported");
> +		return -EOPNOTSUPP;
> +	}
> +	if (tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL] &&
> +	    !(pse_get_types(phydev->psec) & PSE_C33)) {
> +		NL_SET_ERR_MSG_ATTR(info->extack,
> +				    tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL],
> +				    "setting PSE PoE admin control not supported");

This probably should be C33, not PoE?

I guess it depends on what the user space tools are using. 

	Andrew
