Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3D697D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Nov 2019 06:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfKLGDf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Nov 2019 01:03:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30343 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725775AbfKLGDf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Nov 2019 01:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573538614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ho2XsNUpIsBi4WZFCCaKTISu0ba10Fa9pDqy6quVqcg=;
        b=LSNUbSXWkaN9MunPqJ1DLnXV1A/+6sVPf3w30nz1dvQQERgXXQ8MVnk5J3AI7jIDfQBNul
        PHm+wuAMnan9GYFqTKHnrm54hngS5oOEgyIzRncp9we93j0PhYk3iE/uktBrMvXVQ2ORoV
        r6i/UAJmIBkYJaUsKoAMa5dc4L3/ChQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-0tlUVX-MPcK880JyqerVoQ-1; Tue, 12 Nov 2019 01:03:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9955085EE72;
        Tue, 12 Nov 2019 06:03:27 +0000 (UTC)
Received: from localhost (ovpn-112-54.rdu2.redhat.com [10.10.112.54])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4117B600CD;
        Tue, 12 Nov 2019 06:03:25 +0000 (UTC)
Date:   Mon, 11 Nov 2019 22:03:24 -0800 (PST)
Message-Id: <20191111.220324.1668294384096794671.davem@redhat.com>
To:     madalin.bucur@nxp.com
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH net-next 0/2] dpaa_eth documentation updates
From:   David Miller <davem@redhat.com>
In-Reply-To: <1573473792-17797-1-git-send-email-madalin.bucur@nxp.com>
References: <1573473792-17797-1-git-send-email-madalin.bucur@nxp.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 0tlUVX-MPcK880JyqerVoQ-1
X-Mimecast-Spam-Score: 0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Madalin Bucur <madalin.bucur@nxp.com>
Date: Mon, 11 Nov 2019 14:03:10 +0200

> Documentation updates for the DPAA Ethernet driver

Series applied to net-next.

