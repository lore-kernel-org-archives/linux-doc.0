Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD764296BAF
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 22:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784501022; cv=none; b=B2Inupe2JTn+OP9E0DtNvs+njypz1IRLwZiYsoDOzQjGVH5j5wZpxrcFeXkkpnl6WZKpP2fR6eEqn6PisB6SwzRJMg8YXwfU6X7hCr0FRg8oJ/yvI0wvEPizSViyj87PNnwW0yA68lF1S1ZZB+TUdEArysGcVvcVKdkKW/e6Ddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784501022; c=relaxed/simple;
	bh=bU9rfzZw+sYihYNfDvN67BphozTyaKjVAaqwYvV7cOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BW+7SKDmOv6NBVGPqrwMjOHMMBg337wOzdQ/AL25ePATBxTXxlvgEKXhcemvYhBe30WyUlvYIrfiQobO4gsGoi5/0oLjqyeu1yII1qzPevpumorzpjlQlB/TlvGMiWC7n0eriCc3zXyP3Ln9dUwROvSShg/UeLcXGliZd420WE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=ESkrA6WX; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="ESkrA6WX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1785105821; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	References:MIME-Version:Content-Transfer-Encoding:Feedback-Id;
	bh=Lowszjnb5rLCrQz02KnFZwZejwYL9GUBNjyM8sCLN5I=; b=ESkrA6WX9frUk
	pK0h2QmncLm+Ya4dhZBLXs4rp1usHWfyVs9FYSgtXoPChcOL14Bl5RAt+8vanzRi
	PDjBP4kGIQOC6EZGmehWk5VV1QgpQNhxfO15Q9I9bnLaysYPyoJbBSJbYjFbU8TD
	yxONCM7JkmrE6vaQGoKQJ97rckpaaQ=
Received: (qmail 1075177 invoked from network); 19 Jul 2026 22:43:39 -0000
Received: from 197.145.178.94  by turbo-smtp.com with SMTP; 19 Jul 2026 22:43:37 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e655789a1c2c004-004-4288bd4b
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Yahya Toubali <yahya@yahyatoubali.me>, Weijie Yuan <wy@wyuan.org>, mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: wmi: lenovo-wmi-other: Document intentional BIOS misspelling
Date: Sun, 19 Jul 2026 23:42:46 +0100
Message-ID: <20260719224317.2450320-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87o6g250ya.fsf@trenco.lwn.net>
References: <20260719173710.2367930-1-yahya@yahyatoubali.me> <87o6g250ya.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Hi Jon,

Yes, I used an LLM to help me format the email text because I am still learning how the mailing list process works. 

I will work on my next patches to make sure they are well-structured and follow the proper git mailing list standards.

Thanks for the patience and the explanation,
Yahya

