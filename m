Received: from hedgehog.birch.relay.mailchannels.net (hedgehog.birch.relay.mailchannels.net [23.83.209.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6F456B62
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 02:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707187176; cv=pass; b=TAd9lR870VkzG2yMdO/BSJ91wOvYdhpCBWGrk2YP4v0IwpfHGYwMs3cCsWw2ZMcmOsySy/kHv0xptR7J2p/z/oxj0OsAbSbPRiwPdNcmb1kbiuIcJ58pn5Jn78ipV8b4LVURXyXjcWhFGDjr6+yYZyDm5QwkDV9mVQePCVYSzZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707187176; c=relaxed/simple;
	bh=W/xHo7EBWq15rLSvuCHpGNnZytwXY8897YNfNwzvTo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvqJKcczxKlL6mkRjMCmFhxrC16FxA4/I11VGPf0FsyKqadltR8lGBLh2M3UndUN8NOOwrB/W6px2D2xDWblvfZdruZgArHqvnw+kaMfU3Hg+DrzxFazjCxa/k0MtWib8v4vQm8iIGNYoEIAGYObUXiNFyV8WYVegRtbhNp+Bx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christoph.anton.mitterer.name; spf=pass smtp.mailfrom=scientia.org; arc=pass smtp.client-ip=23.83.209.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christoph.anton.mitterer.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DD521C3B3B;
	Tue,  6 Feb 2024 02:22:46 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2A670C3666;
	Tue,  6 Feb 2024 02:22:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1707186166; a=rsa-sha256;
	cv=none;
	b=MJC2TesbudfmvGd0Fwxl8TyCsyorhUBikhj18aeYOMuG+5H8zDiqGPcuCCYj4nIDzRKMfI
	9+4CVZogcqtPg+boH/VtkcYqLTFRUcm/dKWK1EaPID8jB1CH+WKu8JYxB7JZsCCjMt7XYd
	rZA7bo1yLOMoYM3133ewluj+3097jWW55JR3KDS2ukRzzq82z4ziW40rvV6DAMHdmvfi1s
	30hxtnotq69JsneXVJh84Gwh1+sdqasY6GkN/7f0KaTPSKls4zpTM+lLCbf+VOHyIcCKWR
	BFsvIBshSg+72F/z15a9oD6pc++eE20DqjoLj2dI535+pPmos0Gr/gIN+ycQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1707186166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pdue8lgfhfcDhER0uaVFq7TCikzkVbgCcY/JASIsq20=;
	b=GHi0qwVmTlYJA91Booswy6EH6mVwVtSAZ+RFgXkDem1A3PJMktylzk5Cpxjtl0QSOIAuGr
	yITD6ptbNOMuuh/paTclDBIq+F9l+DEROFW3XECOWfgcBrX3FXv2KYMy1mGb1u4TiKNGcl
	iExfa4RQqCXMI8BJxKEumN46AMSzE+m6Ii7uakqgh8QXppGa1L1JMt7tXUmIktreb1xBXZ
	O8DRUeGHYO0LkUzjCTQWkc+OHP+/0IxXgbpq1ykktaG5XZn5ZtOB9/5H26vG2QfHpk4+tD
	nw8bRWuCxYwRe65C8YGi0L8PmK1xfdtLSZWpRHHPb81AcJwvOdie6keJnkUBTg==
ARC-Authentication-Results: i=1;
	rspamd-55b4bfd7cb-chnz7;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Well-Made-Trail: 6e7047656159b603_1707186166799_3440885937
X-MC-Loop-Signature: 1707186166799:3290417122
X-MC-Ingress-Time: 1707186166799
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.127.213.229 (trex/6.9.2);
	Tue, 06 Feb 2024 02:22:46 +0000
Received: from p5b0ed8de.dip0.t-ipconnect.de ([91.14.216.222]:41102 helo=heisenberg.scientia.org)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <calestyo@scientia.org>)
	id 1rXB6f-0002XR-2a;
	Tue, 06 Feb 2024 02:22:44 +0000
Received: by heisenberg.scientia.org (Postfix, from userid 1000)
	id 734A0197B773; Tue,  6 Feb 2024 03:22:39 +0100 (CET)
From: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH v2 0/1] docs: proc.rst: comm: mention the included NUL
Date: Tue,  6 Feb 2024 03:22:17 +0100
Message-ID: <20240206022237.794761-1-mail@christoph.anton.mitterer.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205154100.736499-1-mail@christoph.anton.mitterer.name>
References: <20240205154100.736499-1-mail@christoph.anton.mitterer.name>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: calestyo@scientia.org

Hey.

V1 of the patch explained matters purely from `TASK_COMM_LEN`’s PoV, where the
last character is the null terminator.

But the documentation is more about the file `comm`, where the last character is
a LF character.


V2: Addresses the above by also explaining that the null terminator is printed
    as LF in the file.


Choose whichever of the two you prefer, I don't mind.

Thanks,
Chris.
