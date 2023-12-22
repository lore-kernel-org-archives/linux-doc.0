Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182033CDA
	for <linux-doc@vger.kernel.org>; Fri, 22 Dec 2023 23:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="HEk8CCyX"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4259a275fa9so16946821cf.2
        for <linux-doc@vger.kernel.org>; Fri, 22 Dec 2023 15:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703287225; x=1703892025; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Jg7LMcYWmIaO2CCXqAm9eI5kBh+J6fmP6S0jJw0ctc=;
        b=HEk8CCyXVpRTXfZspfj39SUyS4DU/eQMnZmT1tGeQI1AnYYGZ5io0zrwQIVezuMlsA
         lFLn2Q6ou44DLBmfg5eS/4ioHHmqTxfW5SlSLUx0z4amDEG8U4BvXQfRp8PyS6X5ytMB
         XZ88VD0noTiU/PKiTO06Jq/hWTTlU9i4CDu2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703287225; x=1703892025;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jg7LMcYWmIaO2CCXqAm9eI5kBh+J6fmP6S0jJw0ctc=;
        b=Spyts1q4ahGKdDSv/z+btx7HMviYdQsoyEUCGw+1VUUrHUMpP80MIQPftXVFVlfOXh
         5sQuO7qptj1Cc50xY3fezvmc5n5TPlo8UoncLq1zHfXftcVgu6E7GK8/k3HHpck8NHHC
         YYT8/9jbV6Fzhupv+fEgvA2mQ7P5cYE8rsuAFHtow1nLbF2OjK481f18evLCSqQ4Srdc
         XXihXkIyeuW4/n1B/6kAwhj8duoeUKjWCdtsPI118OCIJ0p5k7NK0ucE0HzsFRX4MgIa
         uD7VcblxTIEKnVLzv9K4yvsfx2MuKfDYfCnQdJPwaZK1hgnqGH1mF37bEKuQAwh18zaW
         sWiw==
X-Gm-Message-State: AOJu0YzDmYRpqEOG0bfgkCsdSidHy1zSRn8yiIn5WyrrfziYNriqOgtJ
	PddzRGzcxBnXXgbBP/bvcy0t3GFs50ttzw==
X-Google-Smtp-Source: AGHT+IExPRV0xYIbsvxIADUup4X9pzFtDEINzww7SWOX1CCloC1or5IhgO/WejPOcQTfeBlzLDDffA==
X-Received: by 2002:a05:622a:1012:b0:403:a8fa:b4f5 with SMTP id d18-20020a05622a101200b00403a8fab4f5mr2938148qte.4.1703287225620;
        Fri, 22 Dec 2023 15:20:25 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id df24-20020a05622a0ed800b004275e9cdf15sm2226878qtb.11.2023.12.22.15.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 15:20:25 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v2] hwmon: clarify intent of fan min/max
Date: Fri, 22 Dec 2023 18:20:14 -0500
Message-Id: <20231222232014.4561-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <632bd36b-1652-4c74-9d78-ddea6ce77a00@roeck-us.net>
References: <632bd36b-1652-4c74-9d78-ddea6ce77a00@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

> NACK, because that text would be required for _all_ hwmon sysfs
> attributes which simply does not make sense to me.

Fair enough, thank you for your time and comments.

~Ivor
