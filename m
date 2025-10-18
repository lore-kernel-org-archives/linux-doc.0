Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A619D89E
	for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 14:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760798650; cv=none; b=fc0odh0PQcS6ErtO04RMDl+W9BhOkr4DIG6rnzpoOmLat4xjN7+vJF0JTW6lURbJ7kOPobzgpCnFx7n2gmEUcUQos2ZMQc98Rcny23L/t1O7ZR5zJJV81nB/9LHwNzoNl3vLAweJFotkrSH5+t6/F7BJ14sHCFwysEMN8O1NvIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760798650; c=relaxed/simple;
	bh=Yiokp8AOA5MBIRRXxZYT3h+Zvsu/4zjHnYtyy0zJE7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rR04U2ieM9ZD646XfVqpZP6ehfrACUnJiOwz4pHuP3e5nugvE6uaDb0T6M1It229D7yHfd9RPWR19JKLfJOVfIPSImdffvsJpDjQEclO7sbDklMvr0oKudQz4yzX9KW7pBNI8PUcK38lq5p4wp35eb4mfjTQlXGwH5RWpyinPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com; spf=pass smtp.mailfrom=mucse.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpsz19t1760798552t654e3757
X-QQ-Originating-IP: hsCyHceUJdBsC2HmerHfDa/gauk7WW3wy8RM1wqSyZI=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 18 Oct 2025 22:42:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16127192191837545862
Date: Sat, 18 Oct 2025 22:42:30 +0800
From: Yibo Dong <dong100@mucse.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, andrew+netdev@lunn.ch,
	danishanwar@ti.com, vadim.fedorenko@linux.dev,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v14 3/5] net: rnpgbe: Add basic mbx ops support
Message-ID: <F5F360A04D1E1CAA+20251018144230.GA4362@nic-Precision-5820-Tower>
References: <20251014072711.13448-1-dong100@mucse.com>
 <20251014072711.13448-4-dong100@mucse.com>
 <20251017170703.3c2dba37@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017170703.3c2dba37@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: Ob047hH1itO57d3RtzjpdoVn7PaYRVnU9L3cRxvoQtYJhUC5rlAPJ8xH
	xyJIP1/dZsahx5E3zgFoV54KT/gp9UE8FfnfhDB0F3OYgGQh++nPgC3KwQOUJx8YSZk53EQ
	l4j7xcUXj6jbcwpw5x6x07HW6cLbj/YqvxvPoEzxKtWzszUyHtCGfoFgTn/WPt6SIEqUpAF
	saAjUrAA9tf3aMnPqxACKTLm6ZFVBCkXSZJz7EbYa46D6aKf+NF/RNGZkhSgnGBM0T9ybsv
	h31ck7GXkFHCuk9RhtIvePNXLJnkskMWu7huUsCLEiinozLj1ja6SWiRaOZhjbBSXERTxym
	jhGmYdMQZ2gNSUwM5o3x45ByU5p/W/STzk2yEPGGhUAm2hUFan8wQ+GqAUHnn/DeALyrYxS
	hRM3QLavRofzmN0EJ+Iptuaa3C6yiCXg2FJJZ8/KYgwim1Q7dkc2bhMB33olmvNKlQBou2H
	h2FZ1smWqft1BOFFSTt9LaS8R+nZpSeUPNz/C9wPSTsZUmWWozQzLs/n+48t+tFGD66CJj/
	jpjyd9SJFA5BbnRKmzRY2MebPlSgktod38qqS08cXFgixDxskdMAqIF0/hMTmyv8pu6pnei
	xpoiWeo5fjplC+Ql6oVZxPgV1IDe5hXlMhDnLVTpg3ZRPwxGRku9J5FR3Vsk/aTItsTE8X8
	U/tgU1bJW8K+mQ9brO0eyfEm7sa2jYIIcWXvlTp/C8zA8UYxvbSrk27V+lhtu4+KxEyuYNe
	O8M1c65yYtsOY1Q/XZNF6bN6+xsznYNRdJOLKybLzqqgTcnzFGElCAPdT8rgm2ZhwI5Y/Um
	mDxsLm6bTBwTQF7yMf+Tt6Ka57d3Z+Sw65KZ/eoNMynJQjTtNmZcmTsOQjaiq4LMiGEs6N6
	Pp9CjhUPEq4tOSTb1vbPcmfpE5ifwGQMX9Jcj0wb5T7fagjwW4zCZOmGG9c2LOkeQG5UZ/C
	ywcxLOXk9Z0NTgJjbRc8FcVnnky57M6PcJoXChF5TfXLBrd8qVAp47at4tQga4fmBypD742
	9f94Ki19OYiYtXWuMc
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Hi, Jakub:

On Fri, Oct 17, 2025 at 05:07:03PM -0700, Jakub Kicinski wrote:
> On Tue, 14 Oct 2025 15:27:09 +0800 Dong Yibo wrote:
> > +struct mucse_mbx_stats {
> > +	u32 msgs_tx; /* Number of messages sent from PF to fw */
> > +	u32 msgs_rx; /* Number of messages received from fw to PF */
> > +	u32 acks; /* Number of ACKs received from firmware */
> > +	u32 reqs; /* Number of requests sent to firmware */
> > +};
> 
> Probably no point adding these stats until you can expose them to the
> user..
> 

Ok, I will remove this for this patch.

By the way, I think there is a similar situation in patch5 (about
tx_dropped), just bellow:

+ * rnpgbe_xmit_frame - Send a skb to driver
+ * @skb: skb structure to be sent
+ * @netdev: network interface device structure
+ *
+ * Return: NETDEV_TX_OK
+ **/
+static netdev_tx_t rnpgbe_xmit_frame(struct sk_buff *skb,
+				     struct net_device *netdev)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+
+	dev_kfree_skb_any(skb);
+	mucse->stats.tx_dropped++;
+
+	return NETDEV_TX_OK;
+}

tx_dropped stats is sugguested by MD Danish Anwar <danishanwar@ti.com> here:
https://lore.kernel.org/netdev/94eeae65-0e4b-45ef-a9c0-6bc8d37ae789@ti.com/
----
> +static netdev_tx_t rnpgbe_xmit_frame(struct sk_buff *skb,
> +				     struct net_device *netdev)
> +{
> +		dev_kfree_skb_any(skb);
> +		return NETDEV_TX_OK;
> +}

Extra indentation on these two lines. Also, the function just drops all
packets without any actual transmission. This should at least increment
the drop counter statistics.
----

And update to my own stats here:
https://lore.kernel.org/netdev/20250923181639.6755cca4@kernel.org/

And I am not sure how to deal with it since 'mucse->stats.tx_dropped' is
not exposed to the user just like mbx_stats.
Please give me some sugguestion, thanks.


