Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600D599;
	Tue, 12 Dec 2023 12:42:57 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-551d13f6752so897082a12.0;
        Tue, 12 Dec 2023 12:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702413775; x=1703018575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RKpLGaA8Ia/uf0mTvVfdT4SxovGrU6OaMSkE9u1zJU=;
        b=CYvwtTiuYpvRoOJoX3a/htxVetNM0ckoNKt/KQTCEu1gNhlvN4ROXujs5530y1QDn3
         7UK7RVLpZ7Z3ZN4TiNfolt4AkgrzW2FR2PN6v80DPQq1Wg/BjlB1tyTyzPOcj9eZpJI/
         EoA0NP9cS+Ss38DGsptyWV0XE7MfDrJxH+pMI/VZvyna9WBxzCw7McaxZEMmBzb3EbmW
         NT1VE+s4SAjz/aMZLwtPsYRD5NjTqpUITykyBptVHUGHR3I7Aetv6oq/vdGYGYx7IJcx
         HbN7j6Y0sjM4ktrD4fEo3rwLYYFHaFJToq0vGFD/fz0fDE/4Hf7e4zU1wiLE3hSq2Dc7
         J0SA==
X-Gm-Message-State: AOJu0YwRpCpFZWs9u3ZrsRNhbhlaCi3ZBrM7V/mrMs2ywqdHcfDZnbpV
	nxbAyTVmy5BGFD437+ukOqc=
X-Google-Smtp-Source: AGHT+IG/+sq5pD1fjf04JMvhThcIkRWctYyXYsnObBGp5yIJE/rJ4astQmDTkLN8tHYAADfH53/dDg==
X-Received: by 2002:a17:906:c0cc:b0:a1f:612a:d3b5 with SMTP id bn12-20020a170906c0cc00b00a1f612ad3b5mr3482794ejb.141.1702413775474;
        Tue, 12 Dec 2023 12:42:55 -0800 (PST)
Received: from gmail.com (fwdproxy-cln-005.fbsv.net. [2a03:2880:31ff:5::face:b00c])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b00a1df88cc7c0sm6653301ejc.182.2023.12.12.12.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 12:42:54 -0800 (PST)
Date: Tue, 12 Dec 2023 12:42:53 -0800
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>, donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 02/11] tools/net/ynl-gen-rst: Sort the index
 of generated netlink specs
Message-ID: <ZXjFzc6nCUnPmJnK@gmail.com>
References: <20231211164039.83034-1-donald.hunter@gmail.com>
 <20231211164039.83034-3-donald.hunter@gmail.com>
 <20231211153000.44421adf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211153000.44421adf@kernel.org>

On Mon, Dec 11, 2023 at 03:30:00PM -0800, Jakub Kicinski wrote:
> On Mon, 11 Dec 2023 16:40:30 +0000 Donald Hunter wrote:
> > The index of netlink specs was being generated unsorted. Sort the output
> > before generating the index entries.
> > 
> > Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> 
> Reviewed-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
