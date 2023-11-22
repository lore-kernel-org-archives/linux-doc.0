Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TZ1c+8Q4"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01ADB1A8;
	Wed, 22 Nov 2023 09:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NWYiihJzvnP/f0mKLagYq+EKWtW2rMV4omwMd1/Y5dA=; b=TZ1c+8Q4ooWiZfrvvZq628ZJdT
	nEIvYAmc3SJFqgNDto/YW0FHn+Wq8f7dtJg4pKXWFepLXEdv/jor5Z93kLksgTkRsnkYstsyIrB/E
	ALIho6XMHIxbO3wUk2Dtl7Y1IxqrI1YEC2h51f/rDNn4K3WpyhoDHfo52Z17NlZ2ogEU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5rME-000to2-0y; Wed, 22 Nov 2023 18:49:50 +0100
Date: Wed, 22 Nov 2023 18:49:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 9/9] net: pse-pd: Add PD692x0 PSE controller
 driver
Message-ID: <d286236b-34d0-4146-b607-4b277dc6779e@lunn.ch>
References: <20231116-feature_poe-v1-0-be48044bf249@bootlin.com>
 <20231116-feature_poe-v1-9-be48044bf249@bootlin.com>
 <2ff8bea5-5972-4d1a-a692-34ad27b05446@lunn.ch>
 <20231122171112.59370d21@kmaincent-XPS-13-7390>
 <04f59e77-134b-45b2-8759-84b8e22c30d5@lunn.ch>
 <20231122181647.06d9c3c9@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122181647.06d9c3c9@kmaincent-XPS-13-7390>

> I would say it never supposed to happen.
> I never faced the issue playing with the controller. The first communication is
> a simple i2c_master_recv of the controller status without entering the
> pd692x0_sendrecv_msg function, therefore it won't be an issue.

Great. Do a pr_info() or similar and keep holding the lock. KISS.

       Andrew
