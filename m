Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6F7305978
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149364; cv=none; b=QbnTZBwS69kPfoG8DZokw8Dr6zJUUVQuXBA01xmVbVCat+AjQP36eD+YzJmCkbwSpmQf6KpYyabupnEiDjAiNCYrQbN4A7K+QXgM42VULYJGDP1Nhc2REKN/Lo5layGqH4EtHszUdfy3qdUkyUECIvTPYL7T6y1IZ4V3Xb9dQ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149364; c=relaxed/simple;
	bh=XEgbhasiEpSms0h402RHZvPDr5E5khBsLB1SqkusMcY=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=VTn6suJD+Vtz0OWbN3dr/uvJrQ9twofU6BnMAdNQojhhv8btFlvn25RTJjd/frYsZ8KCXlhf2fn7LTQlOfqTGtDNsNzDd9FXXiXENAB82QNDOxgoN6qFHziuSDif8cgo5w42oRgvkJRIIi3GupqAYZg6zt951owboyP9udyMkxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WU0k6kyw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WU0k6kyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764149361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P+aY+5ew8rcXS+xACgTbpXJmyaLs/YT49cWfbDySIt4=;
	b=WU0k6kywhb0kGnZwNQITjqrkpko7uICVAe0zCTO2HNQBY012I4rDjcWJyfdfcFlNbXyBX4
	wdxSmXZIiKSgPQQqu7Qvohzo5joUB1dFuEMgWwG/mIL+ayXkMqUZP1+83/jXBNVgQ9Kwef
	mG7uqJhhhTVVURAEH/oTWXEtHfgbsIg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-j7Mb_VQhPOmR4Wu3kWLr7A-1; Wed,
 26 Nov 2025 04:29:18 -0500
X-MC-Unique: j7Mb_VQhPOmR4Wu3kWLr7A-1
X-Mimecast-MFC-AGG-ID: j7Mb_VQhPOmR4Wu3kWLr7A_1764149356
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A894F19560BD;
	Wed, 26 Nov 2025 09:29:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2435919560B2;
	Wed, 26 Nov 2025 09:28:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251126025511.25188-2-bagasdotme@gmail.com>
References: <20251126025511.25188-2-bagasdotme@gmail.com> <20251126025511.25188-1-bagasdotme@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: dhowells@redhat.com,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Documentation <linux-doc@vger.kernel.org>,
    Linux AFS <linux-afs@lists.infradead.org>,
    Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Damien Le Moal <dlemoal@kernel.org>,
    Naohiro Aota <naohiro.aota@wdc.com>,
    Johannes Thumshirn <jth@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>,
    Dan Williams <dan.j.williams@intel.com>,
    Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
    Daniel Palmer <daniel.palmer@sony.com>
Subject: Re: [PATCH 1/5] Documentation: afs: Use proper bullet for bullet lists
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4103078.1764149334.1@warthog.procyon.org.uk>
Date: Wed, 26 Nov 2025 09:28:54 +0000
Message-ID: <4103079.1764149334@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> The lists use an asterisk in parentheses (``(*)``) as the bullet marker,
> which isn't recognized by Sphinx as the proper bullet. Replace with just
> an asterisk.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: David Howells <dhowells@redhat.com>

