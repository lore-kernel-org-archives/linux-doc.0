Received: from shrimp.cherry.relay.mailchannels.net (shrimp.cherry.relay.mailchannels.net [23.83.223.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FE6EDD
	for <linux-doc@vger.kernel.org>; Fri,  9 Feb 2024 01:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707441825; cv=pass; b=pSZjnNqHOFE2U8sU/yskW3T+UauQPTtH7VCXa5WC68eOGJoucrd2cietMO9VoG+BMCvVcZUn8eDvuo5yxlTSMLuSRir1fe0EIrL/VcdFT9rdE6CACVRUpC1o0HVq3qiN4QfKc9my7MokfoJjZ68nq/SbqroC8X5WrW0bknAOcJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707441825; c=relaxed/simple;
	bh=IDx9zlRcAWcUVDRQeacPL7ZVF9ZKeM2yjM4CL7zCew8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lw4uN2RekQ8BEfaLOZgQ6N1E4Ms3VjIVbrwcBxt+RbsBpnfFKEPvk6MpKx/nh9M0wg+447PfolNfWLb+GXIgbK5vMys5IOBh8N+1YgvFX5dS7VxwiFUZhby/AqGJP1tsgUDSSbcEhopnxKkCwBzWdq9WwpZHrJ+lXPu9hQWOupo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christoph.anton.mitterer.name; spf=none smtp.mailfrom=christoph.anton.mitterer.name; arc=pass smtp.client-ip=23.83.223.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christoph.anton.mitterer.name
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=christoph.anton.mitterer.name
X-Sender-Id: instrampxe0y3a|x-authuser|mail@christoph.anton.mitterer.name
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E88F8902355;
	Thu,  8 Feb 2024 22:59:04 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id BF3639022B4;
	Thu,  8 Feb 2024 22:59:03 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1707433144; a=rsa-sha256;
	cv=none;
	b=nuEjVcKIXAAUbB+/Q5mCe6OKy3aJPtNPNqDuMrvVFfuF4o+DzV4PrOsLR5FBAKBt5ps5fM
	CrLwbA9/I1fBxgyHsACifhBxpgZvFKH+V5f1D5baozcKNlb6fPJcX0qLyQDL9JVJz0CIL4
	0rFZhLv5lIKp/1gYkkCpTMdKvrnQwli2/16P+k27vVc4P04v8L24abBHLxryHWPCztXbQ/
	7OxTZr7UDAOrMqSZNfSw99gFabuxt0ZAdhcKC3HOIo9kyGeot94Nv9HgCzuPJgH/QlqWg3
	eYHRm9pD2hCuaeK/seaKPJsMFR0I9TEe5hi4TjIyF9I0dqcOyMizuy/upvNbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1707433144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDx9zlRcAWcUVDRQeacPL7ZVF9ZKeM2yjM4CL7zCew8=;
	b=867y51rdJIc3CTnY5pclvf+CAo/m/jdh9LUHQHF7vBz5b/rV4+8hVPPgatwLaKkl22QReu
	ZP9SoooGML2SPCMi3Ti3ig1fZRXdUASiWAWrXnOabFLKccioSc0uKh9uwcpD4sIwRb7h60
	RaxvPYM9Nguzi/kbUvd4iH9y6nMd7E6sRdEdYb/11+l8+nTzaQezkbuk1SajMa84TAhCyt
	CtxUvbptAFszyyZQXiiMphM6vy4q2Y32yueAtbFItOjdASykCLvXtZ/aYYTnAifzva6R++
	P8bXN8dZuOzF6jN0oyL26rHs7x9zm22HOyYvWP+N16tBCrW8f4GyfVvcuXUxPA==
ARC-Authentication-Results: i=1;
	rspamd-6bdc45795d-m4dzs;
	auth=pass smtp.auth=instrampxe0y3a
 smtp.mailfrom=mail@christoph.anton.mitterer.name
X-Sender-Id: instrampxe0y3a|x-authuser|mail@christoph.anton.mitterer.name
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 instrampxe0y3a|x-authuser|mail@christoph.anton.mitterer.name
X-MailChannels-Auth-Id: instrampxe0y3a
X-Hook-Desert: 2955947233d69176_1707433144401_3372979003
X-MC-Loop-Signature: 1707433144401:1853996338
X-MC-Ingress-Time: 1707433144401
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.113.22.51 (trex/6.9.2);
	Thu, 08 Feb 2024 22:59:04 +0000
Received: from p5b0ed8de.dip0.t-ipconnect.de ([91.14.216.222]:52182 helo=heisenberg.fritz.box)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mail@christoph.anton.mitterer.name>)
	id 1rYDMA-0005YF-07;
	Thu, 08 Feb 2024 22:59:02 +0000
Message-ID: <ea94f36549586451a19ea2973ec66a219cf27340.camel@christoph.anton.mitterer.name>
Subject: Re: [PATCH v2 1/1] docs: proc.rst: comm: mention the included NUL
From: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Date: Thu, 08 Feb 2024 23:58:55 +0100
In-Reply-To: <87il2yfua5.fsf@meer.lwn.net>
References: <20240205154100.736499-1-mail@christoph.anton.mitterer.name>
	 <20240206022237.794761-1-mail@christoph.anton.mitterer.name>
	 <20240206022237.794761-2-mail@christoph.anton.mitterer.name>
	 <87il2yfua5.fsf@meer.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-AuthUser: mail@christoph.anton.mitterer.name

On Thu, 2024-02-08 at 15:47 -0700, Jonathan Corbet wrote:
> I don't understand the line-feed comment at all; printed by whom?

I mean when reading the file /proc/.../comm, then the string seems to
have a trailing newline (LF).

Perhaps something like "provided" or "given" would have been a better
word, but not really perfect either.
And "written" or "stored" would have also been wrong IMO.


> I think I'll just apply the first version, which explained the
> situation
> well enough.

I'd also think it's enough, which is why I had even written, that you
may pick whichever you like better.


Thanks,
Chris.
