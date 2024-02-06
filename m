Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7315C90C
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707217017; cv=none; b=lEC6sx59OnaHo6u9RQOWgGawTMXbO8UT32qTzXhLUy1lA3/x07xR2XzxVYZB96GToxHqmwIYNELHQifvy9oVGpHteYj9dRnjcz6fT4PCpINvMC5K0l7hGiuHRWRdvOEWN/a+/NWHAcvztojBtcuJKDSHArfCpgkE8b8hUB3RszE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707217017; c=relaxed/simple;
	bh=8vOg9PtERGFIzxGfr1uQ777xA4qgfnvqvPqJZtaB7dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TRVjYc4PGGRXMVrx9ypRADRdFBmGLmHLC9bfSFj3WFnTrPzhBrGsFs9qkFxR0EqIHWsj/MCQut/JEV0sqghq1Hcij8kH60W5I3WNJm+pwJ9i46tPDHFC4GLU8WdEKKPZ8HBJPrR5htOP7JsL3HNJsTWv0x7bt34DOE783SjzKok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YIe+sRjB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YIe+sRjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707217014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NOcDAAfRrdOruM3vQufk8xXSJsuXJBYipbiUl5Fyob4=;
	b=YIe+sRjBNCDAfrjVzyEvzF2qN8h6BeUU4xtCf9NL2kRbJYz0EuJzlvQeb1Sdg4jO7ZD+9C
	0OULE6yJTsD6UX0fzCmfYzESba8TdfvNIyVBNaGEG3pqvojMg9a953awTudYTE1Z9LNIsM
	vkEz+1tk2gNoD/7B4E957R4LNxdSg+4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-xktzKIJNNXCzY4JELiCkXQ-1; Tue, 06 Feb 2024 05:56:51 -0500
X-MC-Unique: xktzKIJNNXCzY4JELiCkXQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-68ca5f30b20so18523516d6.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Feb 2024 02:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707217011; x=1707821811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOcDAAfRrdOruM3vQufk8xXSJsuXJBYipbiUl5Fyob4=;
        b=TJq4MXwUmgHR7vwUQPZkBLvNiwb4ruihcpFko6Yr28wMdem9rKgEkheb1Ilq/uevg3
         Uy8V14ExqNoqnN6FXBd0L57x6choZJXaxY9YIY9gPQsa8v7O8kcXx0Z+tIsQ8jMhSElT
         dFNs71hr+swROoDIFJEfpBzRRsVGv7Ke3GsqnhlBylyjnBbF3I9Pc1ow+v7e42AYviHY
         MdUYLmzgzp9nogA6Av9e0RODYSrn3DE0wcJEbBCJ3pWKcOyYoQyu+CjULX3Ke8iWwPoO
         zh+FGfumhWuTyTK9nycHoJ7Wyv+5PXjdI7MgfStetM369kw3QvGfQnPpJGTbPo/PxgQ1
         ErRA==
X-Gm-Message-State: AOJu0Ywy7VCdNme2/CO4TwXVPCdHFnD9q6qRAMBb7sGCkmtyuOXGyfZV
	50CUN+gxeMVTj61eq2oHDN8Xioz4BVpNIjzdL7rTRBcmAaiMTq2qt3bDE59pAkIK0EquCjzz+xy
	4MBrL7qdK676eCx+aU+hb8extICqJMNtgxOOysg/4ottnnuxcP7rRXjdO
X-Received: by 2002:a05:6214:21e9:b0:680:f8d2:c828 with SMTP id p9-20020a05621421e900b00680f8d2c828mr2323848qvj.16.1707217010848;
        Tue, 06 Feb 2024 02:56:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhff2DlHZd/ZEK5FY5fiFC/T9Pyc4sJSO0MZ/TglPCHuCL3o0cMWVg9QtToY7v6Z+KW8fOWg==
X-Received: by 2002:a05:6214:21e9:b0:680:f8d2:c828 with SMTP id p9-20020a05621421e900b00680f8d2c828mr2323839qvj.16.1707217010625;
        Tue, 06 Feb 2024 02:56:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUy6sn6pHYdmwklCBeIPLcmA1sdU6HtNEqv2vI89wRaRuOTRoeDVvkMZSTi8k4LvKuQ+uw3wya3VWjclc935+MWSLQ1FLMXeUPsNKCqJwqo0N6g9CaWIXEbpHIvFW4hY7hdrx/83/UaLEwREYUxlSfIj5OurBwqw55BcvAuQ+neLuoy4C+Z+fIT9uVzHZvhMc9Sz4UEcu6C+LqYKemieSEGBzAP8IaKN126K1tr1tdC4NdMTGdm8oh6aM6Phr+EB36wRQfo/rv0tJjtyfcAZEnIX73Z08xwdYPfFImmhKT+pjVQWpQmPMlEnwVxqnnVrD4ZhbO4AMKT0PFYi1Oki6vJ+bbj
Received: from klayman.redhat.com (net-2-34-24-75.cust.vodafonedsl.it. [2.34.24.75])
        by smtp.gmail.com with ESMTPSA id hf15-20020a0562140e8f00b0068c95b634d3sm909547qvb.11.2024.02.06.02.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 02:56:50 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Tull <atull@opensource.altera.com>
Cc: Marco Pagani <marpagan@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [RFC PATCH 0/1] fpga: bridge improve protection against low-level control module unloading
Date: Tue,  6 Feb 2024 11:56:43 +0100
Message-ID: <20240206105644.41185-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC proposes a solution to keep protecting the fpga bridge against
the unloading of the low-level control modules while addressing the
limitations of the current implementation. Currently, the code assumes
that the low-level module registers a driver for the parent device that
is later used to take the module's refcount. This proposal removes this
limitation by adding a module owner field to the fpga_bridge struct that
can be set while registering the bridge.

The RFC patch is based on top of ("fpga: remove redundant checks for
bridge ops").

https://lore.kernel.org/linux-fpga/20240201155713.82898-1-marpagan@redhat.com/

Marco Pagani (1):
  fpga: bridge: improve protection against low-level control module
    unloading

 Documentation/driver-api/fpga/fpga-bridge.rst |  7 ++-
 drivers/fpga/fpga-bridge.c                    | 61 +++++++++++--------
 include/linux/fpga/fpga-bridge.h              | 10 ++-
 3 files changed, 47 insertions(+), 31 deletions(-)

-- 
2.43.0

