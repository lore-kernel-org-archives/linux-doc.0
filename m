Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EFB3C73E1
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779040575; cv=none; b=ksRuJyoEeSgc7npuGK1FrrI5wlPmNJfqGRqo30bA7MbFS6BhaKn1/jLIrTu14+g/u3gENIfs0ty0RA2DF8GuzdUNPIGDBZ6gRgH1P7wVQ3wetRHLZKqtQoXP1m5N/y/BmQjqp3IbRTUn/Ye7i9YsCJWeEAro6lyOpWmoSAEFqyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779040575; c=relaxed/simple;
	bh=fmoS8JMk0Lj10vQXkFNeX0oc0mZfbAfDYXE5mBenn5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qOZnDhpWpMfGYcmsDdeqK//DC4b+Dv50cVwF3TBypzdzljVnfgVRRTB/oEM0XZmq6+55UPzc+R9zszRnnR8m48+kEuAAs39hyvdHQ4P7Lqs9eAxga2EVR5UbPZc5VUt7sua4HWYHDt8v2XxL8bPklgb4gEXGaVTchO/Ea4zb4EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyWQySti; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyWQySti"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891c569cb1so1761225e9.2
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 10:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779040572; x=1779645372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmoS8JMk0Lj10vQXkFNeX0oc0mZfbAfDYXE5mBenn5E=;
        b=LyWQyStio8kI77UhwkZ1NZKmvZ8ZnM0cH8+o+M2vyaoldWv2JfA8KnsuT+I55i+Qfg
         aLXMRBoGZkhipD7wbjjpfMU6fqHIi/IuWcW3eXgq6i9V5WwjfaQTrQuEe/NkQfriRFvP
         VTeBxszuUeHprCyNHfVu16dm3WFWcFCdQUwbAwhUMgmv+Ot5xkDZGuKirOEt4J6Qbby5
         HeRoS4wzWWkX+HGsHiCLmJ8yphQzBK7KwvCOmTN2fRxZ9oKlGZn74FAi8gQdaXA5XXup
         rtaMIG1qbrt02Mr/2aFrztpCgKKDRxf73hTOxPI5tfJyKAiGIr4VJJYj+qhjJX9K+RR2
         RICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779040572; x=1779645372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fmoS8JMk0Lj10vQXkFNeX0oc0mZfbAfDYXE5mBenn5E=;
        b=RYWLYX+0ql0OuBpmD07XcPhS+DONDdZNHTEToBDRNT0p09wQkXN/HIA34C+8qTBC6Y
         a+mUMMW8lhhY/0ZRwVpM4QszdxC/cvNgIJ0+6zlXNSg62loytCiPLAv+kNV7bx82jzLm
         hx3Y8W8607uAPotLmYb/G9Qf3NYAmAAsUBdJ5XfNpsrqb4FSILQODw18qvwI+A7a+e7w
         vZH6sbbD3+8QXbmIXNoEksnmx0BRwI2i28UbxJuyMGfQTwNdNvR+eIhwgpMdiLFnDcuW
         HIeVIURHxZk1eEE88FUaxf3NCl21MPfJI+Bg2reSyOkOhKfO8+cATFJ1yeBFI3VVbHg6
         7M5A==
X-Forwarded-Encrypted: i=1; AFNElJ9nBA0Jrxc7xcVzU6yJn3tAvYcRII+PZw7O+P4DWcglImQEIcgwjyH+iisSEHqoy3UJkOf9n72LbC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbRiDAknoxG9pxQW39AL6rl86t+BSJxvCeDmdR2qxFygpcnIz
	aihs0SLwhttLUcyam/vwjxZxEn7OZ82vKvio1AiM75hnJZbEi7rYayxo
X-Gm-Gg: Acq92OEXTXVgFuvlKjlj7rzoHOeH76E8bkDQaaAMOr+XMSJ19Lk6hv2Gx9GjvsUcWd1
	bMDlK4GPGbcsHlYsErRVcetUQcT1XaZDcVvZBfDlW69g4QcvbGXO1YqpSk/ZbzsF/rsyRF0sTj4
	9fcizLl+/OCpPsugBZiEtOL4FfJ736cVGsc8lBf+e8v9hDMqW7p7aESaX2wgRtPq3zo4DC2VLeq
	RXrSh4GmTKZLo2rItVoZRg98LgNb0Tk0boodDEP8p3/6nWn6eLLgpLUYCB3qtZo15YQevW57iCb
	EbS1xHf9mIPw42KpQFi0ZdwlUqiiegVi53RsfZzTznoxqQ2skIMBr7hy/UfZvHJpZlHB8WxToqm
	vlKAZr5+S7JX6TlTKROJyG/R6p2BNFUL1uwZGaPi841saEJAhydtpRoPLa0TyPqt5chwB0coqH/
	nlDJvP9+Xo+XwhAa+G6Stqzpwkqi47zsCNwSYO/3f5STW2
X-Received: by 2002:a05:600c:3ba5:b0:488:7e7b:dbc2 with SMTP id 5b1f17b1804b1-48fe61f7b16mr110487595e9.3.1779040571760;
        Sun, 17 May 2026 10:56:11 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6b60csm86459105e9.6.2026.05.17.10.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:56:11 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: dlechner@baylibre.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	jic23@kernel.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: add match for IIO API docs
Date: Sun, 17 May 2026 22:55:57 +0500
Message-Id: <20260517175557.2019-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260517-iio-doc-triggered-buffer-update-helpers-v1-1-7f00d4188f6f@baylibre.com>
References: <20260517-iio-doc-triggered-buffer-update-helpers-v1-1-7f00d4188f6f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, May 17, 2026, David Lechner wrote:
> Add a match for Documentation/driver-api/iio/ to the IIO subsystem in
> MAINTAINERS. Any changes to the IIO API documentation should be reviewed
> IIO folks.

Reviewed-by: Stepan Ionichev <sozdayvek@gmail.com>
