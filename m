Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103932755FD
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740602167; cv=none; b=EW4aWP07BgS9V34tKpVWoCRQce6kpsaczKnsYZOaUyyyIwYghZNuzRF8ouNnYGkyZFMLn85orEfoGvAteyjQCMrA6bbEq3uv0DtARBftSq74fqxILgTBEaFcjxsWw5OA1fwGOhbJxTwwqm/8gRLTWHr9IkNbxP9ZG5J6fciHwkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740602167; c=relaxed/simple;
	bh=Jg3FHaMtnDrlmcebcInUMAYOKcOKdf88iZTvreX17pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEsSD9oiYxis1MX6PLmPtP7l6dNoDrQKQHAZnlidP4tYOLepOnY5Up6J3yjYxzg0HwI5kq6c2lrEfgebasFpPc1cwTRZytzJqZnr4Ls6elEWlIcY+J5UpiVyU+X8x8Arm8vTBlY0vV3FxDgLQCySwF+NBU+qUMT6Opev2RIFlvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VyrbsEVY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VyrbsEVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740602164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tu+bvA1U5SFUfY4MnrH4mZeqLgVlTLAczTVqxjp2aec=;
	b=VyrbsEVYZbog0dy72I+OXvOOYihEseFdZcmopJvU9c12mh/do25uQ00JaEILMBpxd1eiM8
	Mp26NTwZPT5U8y5p46StjAGqGCtHSpb9yJrvVLpkXQpVxeTxe80YXln+avyJ+EbJVJfqiQ
	Zo7SLejVRwHgrhfnafi3/eDcXdqjAFM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-oEGyXHu9PyKcocYmw376Ag-1; Wed,
 26 Feb 2025 15:36:03 -0500
X-MC-Unique: oEGyXHu9PyKcocYmw376Ag-1
X-Mimecast-MFC-AGG-ID: oEGyXHu9PyKcocYmw376Ag_1740602162
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A53571801A1B
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 20:36:02 +0000 (UTC)
Received: from carbon.redhat.com (unknown [10.44.32.49])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D58971800358;
	Wed, 26 Feb 2025 20:36:00 +0000 (UTC)
From: Jelle van der Waa <jvanderw@redhat.com>
To: linux-doc@vger.kernel.org
Cc: Jelle van der Waa <jvanderwaa@redhat.com>
Subject: [v2 0/1] reproducible sphinx docs
Date: Wed, 26 Feb 2025 21:34:50 +0100
Message-ID: <20250226203516.334067-1-jvanderw@redhat.com>
In-Reply-To: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>
References: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

From: Jelle van der Waa <jvanderwaa@redhat.com>

James Addison brought up this patch regarding reproducible kernel
documentation and I volunteered to re-send it as they have issues
setting up a MTA.

With this patch Arch Linux is able to succesfully when building on the
same machine, without this patch it is currently not reproducible see
the link below:

https://reproducible.archlinux.org/api/v0/builds/742727/diffoscope

James Addison (1):
  docs: Disambiguate a pair of rST labels

 Documentation/admin-guide/quickly-build-trimmed-linux.rst     | 4 ++--
 .../admin-guide/verify-bugs-and-bisect-regressions.rst        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.48.1

