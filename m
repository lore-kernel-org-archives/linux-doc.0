Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885F2D049
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B083A1A2
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 06:53:05 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so1583390a12.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 06:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698328384; x=1698933184;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1z0IlrhuOQ1w9mbE5d2/rfLmB3ROetwhxFQMXYGE/s=;
        b=gNxYb4vUSysWkj4tODCx600TmmtNrNP9lM1P2m+QNVklH31MfrTZnT/v17JjUJt0EK
         oLfItINs3PqcrR9agiUwId73wcJ2nTPhDbZPIqvT72HKItqDhVnukHfOscWc8DwjFmI5
         Tye7mv5kOexs6ytU+5LQKTNWGP5TX8xjbooNaKKh6MiTBfkw99yqHc1TOFTSl2ERG0zE
         DNKdtij7YMfRBm6OfdY/PDu5I2QID84HN3joZJyqdNX/fpsjXQqMyDKU6RSy6ewoR1SP
         5PmXI5ZKLzgkJV0MtPdNtg/mld6I7VojfnViUoqkOPTGlc0e/Oot/ln53ccPsPCJlNKj
         5Hzw==
X-Gm-Message-State: AOJu0YzM/+PUdgQTKZeQJ/XKog068E3oOuTfH/5gRLnyKIwdzb4OWJQQ
	0L13EtqJ51LN7NI6avalGQQOo80jlAQ=
X-Google-Smtp-Source: AGHT+IHGDZprz7IKDFoVtY5MfD/sTdHYhV0/wQO1GlIKzQTltEfiz3pfVyz5Qn9ANMc6egacBK+AQA==
X-Received: by 2002:a05:6402:354a:b0:53d:a1c0:410f with SMTP id f10-20020a056402354a00b0053da1c0410fmr15108133edd.2.1698328383722;
        Thu, 26 Oct 2023 06:53:03 -0700 (PDT)
Received: from gmail.com (fwdproxy-cln-019.fbsv.net. [2a03:2880:31ff:13::face:b00c])
        by smtp.gmail.com with ESMTPSA id t20-20020a50ab54000000b00533e915923asm11635690edc.49.2023.10.26.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 06:53:03 -0700 (PDT)
Date: Thu, 26 Oct 2023 06:52:59 -0700
From: Breno Leitao <leitao@debian.org>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net, mchehab@kernel.org, akiyks@gmail.com,
	keescook@chromium.org
Subject: kernel docs: Fast sphinx-build iteration question
Message-ID: <ZTpvO3tGOkuq3Q9Q@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am working to build a sphinx extension in order to parse some network
netlink YAML.

I am struggling with the time it takes for sphinx-build to build a
single file and run my extension (Directive). Mainly because I need to
remove the `.doctrees` cache directory.

Is there an faster way to iterate while writing an extension?

Thank you!
