Return-Path: <SRS0=MEEV=7Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A709C433E1
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 00:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 360822078D
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 00:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591833637;
	bh=RsnkMHzeRCnQb3oL8sODxxLr2YFZXnpDLzOUw9e1EZE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=NXrxPVLYvIDbTn54ENKYPVxaq060kDXgFzZY9Y7oNNjENU/vrhFGzpD/c18u2VGGR
	 8nicNUOMaElJKxHisvYUwjRvfPUBlCR0I8Q74eTuCEjkrZrWSJCGeOaYxdsIhcM+Ra
	 32k3u7eU0uux3IiRMdtlfoo4r+m8ij/IdQR0HE6g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgFKAAg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Jun 2020 20:00:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbgFKAAf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Jun 2020 20:00:35 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33A4720747;
        Thu, 11 Jun 2020 00:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591833635;
        bh=RsnkMHzeRCnQb3oL8sODxxLr2YFZXnpDLzOUw9e1EZE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pJ+oLXgragThlW1ceRUv8k68RypDybhGpDQfNcy5mfjh2au4gkJxA/wr6yPsDfpex
         QzmG/rx1yszSk3upHzNEOtbPViQJzpPAZ5iS/6IAi5vVj+as9L+idclHVhoiFCnHLH
         VgoCLEsgSvVVUzxArIyBzFvKM4vjLJoPV5yIA6d4=
Date:   Wed, 10 Jun 2020 17:00:33 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vladimir Oltean <olteanv@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH net] docs: networkng: convert sja1105's devlink info to
 RTS
Message-ID: <20200610170033.52e8efac@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CA+h21hpSRF8agAyQ=42qh=KY0+zczCa0E44GMgvmakimfXwDpQ@mail.gmail.com>
References: <20200610233803.424723-1-kuba@kernel.org>
        <CA+h21hpSRF8agAyQ=42qh=KY0+zczCa0E44GMgvmakimfXwDpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 11 Jun 2020 02:51:51 +0300 Vladimir Oltean wrote:
> On Thu, 11 Jun 2020 at 02:40, Jakub Kicinski <kuba@kernel.org> wrote:
> > A new file snuck into the tree after all existing documentation
> > was converted to RST. Convert sja1105's devlink info and move
> > it where the rest of the drivers are documented.
> >
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> Acked-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks!

> Only if you need to resend, there are 2 typos in the commit title:
> networkng and RTS -> RST.

Ah damn, I got distracted checking if snuck is a valid word and didn't
spell check the rest :S Sent v2..
