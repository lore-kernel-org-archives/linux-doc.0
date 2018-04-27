Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8BC227DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 23:00:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932939AbeD0XAp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 19:00:45 -0400
Received: from ms.lwn.net ([45.79.88.28]:55282 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932935AbeD0XAp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 19:00:45 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 66E1B2DB;
        Fri, 27 Apr 2018 23:00:44 +0000 (UTC)
Date:   Fri, 27 Apr 2018 17:00:43 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org,
        Ben.Gainey@arm.com
Subject: Re: [PATCH v2 0/3] coresight: Refresh documenation
Message-ID: <20180427170043.739d4c32@lwn.net>
In-Reply-To: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
References: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 17 Apr 2018 10:08:04 -0600
Mathieu Poirier <mathieu.poirier@linaro.org> wrote:

> Now that the perf tools CoreSight support is upstream this set adds
> documentation to go with it and move things around so that topics 
> are located together.

I've applied the set, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
