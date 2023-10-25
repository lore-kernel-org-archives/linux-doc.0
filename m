Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B203D31A79;
	Wed, 25 Oct 2023 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLUeV1Vn"
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFBB137;
	Wed, 25 Oct 2023 14:44:15 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cab2c24ecdso1411675ad.0;
        Wed, 25 Oct 2023 14:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698270255; x=1698875055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bn215JwE3MZjhWRlUTu9mLmFbTy6WOmyU9iFSWyPlnY=;
        b=JLUeV1VnVVP0HdxrL6H/SEGhxgM62H7vWLpKUjwEhd+QZ+qimixppy3Tyu4heFqBEz
         XrIq26YcxRS252HntbN7VJLPKrnaUDW54LOv2wbunscjmNfbF9q1mPQ8EleCrLg6QyHp
         6Z6mUChZVRejdzPThj1uljHiKFSPztF/YqleFk56mzFkpZYd8KrJXm8nSAY4fjyYqzc2
         DgooZ8nijWIr7sDtx4RbRYWHXCKBIJMB54/diPbY6U8CCG4kXrHlb2EqDwesRXxivNu6
         bTYgaSrtP9nkaAC5Z7zB6TzwF3aS71cYnubyTsu++k03TnelzKqA9+eXOTn8E8dkU0HZ
         YA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270255; x=1698875055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn215JwE3MZjhWRlUTu9mLmFbTy6WOmyU9iFSWyPlnY=;
        b=wAg2z9BQ+pr7cQ/hcQ33Dt3E9SjE1omeUkBvN3XeQ6iL6PA5/Wa4ENDgIZFXVZsAn2
         d2i+L4Thsrkikkpws911jRsjql0enDt7V6YQ2jCQ46fHdTqxGmHaLdP/vK5+hHz8dfBN
         MWz1hM4SCwNUMx1aNzccGwF47NFQawKmfRCqSgNMC5m64CiOfvSflK/QVAejqjQ3yMrN
         Me26eFeLEWqDgqImd4h8s/7dhahjJ/Dx9tlAzxx0ZUsZJ4GS/244rWJM1oizdk7aNEjW
         mQGyFZyHl1mmtPGaT7L4+lbLpi7yDz7/w0ERU2mYkbxpqeU9ujXQJO/wR2sDrYwWosIs
         OD7A==
X-Gm-Message-State: AOJu0YywtLmhvyoCRYHrwgPb2rUsOAW3sY0jYRUj6NhywkMz0C5nQqrh
	2Gfw/DOdn2rDHHHvSanHVCjhBqk144A=
X-Google-Smtp-Source: AGHT+IHybu91yFt4WUlIxD7XbkvH1EnycgLtiQ+mGYDsjlifNPnfQBe/8s1HOxqZHw8x3mYzBJfuZg==
X-Received: by 2002:a17:902:ca0b:b0:1c4:72c9:64ef with SMTP id w11-20020a170902ca0b00b001c472c964efmr11429406pld.40.1698270255315;
        Wed, 25 Oct 2023 14:44:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id li11-20020a170903294b00b001c444106bcasm9632307plb.46.2023.10.25.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:44:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Oct 2023 14:44:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: no To-header on input <;, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/7] hwmon: max31827: Modify conversion wait time
Message-ID: <7f0691b4-b7ec-4009-a4df-a039a64cb715@roeck-us.net>
References: <20230919093456.10592-1-daniel.matyas@analog.com>
 <20230919093456.10592-2-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919093456.10592-2-daniel.matyas@analog.com>

On Tue, Sep 19, 2023 at 12:34:50PM +0300, Daniel Matyas wrote:
> There is nothing in the datasheet indicating that the 1ms error is
> needed and I didn't encounter any error during testing with 140ms wait
> time.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>

Applied.

Guenter
