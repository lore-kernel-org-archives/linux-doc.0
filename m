Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688911F17E
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 15:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Wa/rr+qY"
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1F5A9
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 08:04:17 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32d895584f1so470846f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1697036655; x=1697641455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRkqB8/peQlqSu9v9E/Jxgpb5iu6r7QHy0PIjTwaP3U=;
        b=Wa/rr+qYC8sSKEtftymBPnBFWOwtAUwirmBF/93mEazjvXl182v0aK/83guW5UIg+3
         LvIf0WO9xMZYUcWGqndZvFQyNv3fquN1seN1VZvwOeirw4vPCD7MDh12zjxaLqd9ffQv
         hN1748m3vSN+fdR/RdIdpJuTpkvGYFb9zcEzQ5yh1s3quTAsF0YbklAEQZED/94QYLTb
         0m6DI96wUlDwZ3MAWvcoUhHkTMbZKej9YJLJIma7++uCinn0aA865VUb8loQQtr96Ots
         AcZBjmyijGPOuiqDGYB6aF/oV5RpLoPrOd+J8FCLK/Bwwq6otnAV9CeslfrBz0WZAJ9C
         DpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697036655; x=1697641455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRkqB8/peQlqSu9v9E/Jxgpb5iu6r7QHy0PIjTwaP3U=;
        b=M25Ja9lGIr0LFsRqsfosk7BVBn+5CpZfEn45f4tqGeOm8E/sbGB1Entefqf9THgZlw
         soG/5irLq3/k7le97Hg8DqDSKJaujEQMNmuevAQ608yGnMIkIG8Os3Sec6RZYKP/5b6g
         so+QryVTOOD21tH/261QadF2/moC1YJ8eVOa3S8ytTFBwB3nWw8wFZneaQPFo9eLN/al
         LsMOpFSbbOD4ZESyHvQGxCBLCBp/ckhEqT/saORXuVdp/svDj2wRlmq9KSVwDukILFfJ
         qQnv3dAtvjS1zQk38uhhCNBkq5P/A+u/RGUuSCKYVRTWpY21DSAqHrbOFzKfofS/Q7EW
         PYDg==
X-Gm-Message-State: AOJu0Yx0+vLjOPxM3qa3j1grPkuNvwSziO2E/Yboq4XZtxpYHZ3UvSsu
	NLx8SLwV+0sO0UEeFGxkEBfI4g==
X-Google-Smtp-Source: AGHT+IFfZQ1SiRV7geQ0Uqaa1luLtMmhs2/HZDlMTol8OQRTChK4x+uxynd3PWFf8uF8nkr/44Pylg==
X-Received: by 2002:a5d:548f:0:b0:31d:d48f:12a3 with SMTP id h15-20020a5d548f000000b0031dd48f12a3mr16620164wrv.43.1697036655189;
        Wed, 11 Oct 2023 08:04:15 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id f11-20020a5d50cb000000b00325c7295450sm15782616wrt.3.2023.10.11.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 08:04:14 -0700 (PDT)
Date: Wed, 11 Oct 2023 17:04:12 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wpan@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Rodolfo Zitellini <rwz@xhero.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 01/10] appletalk: make localtalk and ppp support
 conditional
Message-ID: <ZSa5bIcISlvW3zo5@nanopsycho>
References: <20231011140225.253106-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011140225.253106-1-arnd@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Could you provide a cover letter for the set please?
