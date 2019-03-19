Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6AE927D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Mar 2019 02:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfCSCZm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 22:25:42 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:53457 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726884AbfCSCZm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 22:25:42 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 4DAC021E00
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 22:25:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 18 Mar 2019 22:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:subject:message-id:mime-version:content-type; s=fm2;
         bh=zho9sQj2VFauXG2c8WNpygFeVBru72SM9dNxA3jUoyo=; b=TYtgQvdwvlNT
        EcO9W+60OhcBdlx1orrr2VMdF/vhrHUYsIMjJPIbuv25RJiYagvF3H6War9BCuIk
        zR8dU5tBnIeS6WciC9jMJREzkLmVayiPb3IMmSUJFGKPwfm2GXRcCi94lOUeIl5x
        ij4MhWF90y4fEePfd2IOZe1iu4FIH/0mKqLQIfPw88StrVZVo0s4Z8aLdyWwB+ey
        h1ZKPBA8a4IrxcySgWv74NyJwBprFtU2Z4c6gYP+1dAW8Tc6gj0ynqVaELsobW/1
        hefmEug9QVTgSmmGbVk6ai9s/1SjMwWJgpCOU3tt47SEGs3TbKzevW0In85xfGI6
        q8gTLMTbyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=zho9sQj2VFauXG2c8WNpygFeVBru7
        2SM9dNxA3jUoyo=; b=qub2bL5XXvizPD/gMsaQrDrCeWo/ntWH7EkI1SC2Qtj3j
        BfX3Ligxdhjd6J4S+ia1wLM86zVxPINt5dmDdX5ZYRsfu20k4EOFFk+jr8j5wDq8
        7hRnNQuHgjjuYoWhwQs3HZAWZBGX/37GCXtw0nAy97J1PTe8PU6rOMrdq5LewMMk
        p8rFddMyMGZ7XWAylB42RVxHpZSmcfDFg2LqZa7/ubplxonFD5zbOHOw/caLVLUj
        7Xfev6VZsEuJdzf8XMoTmjKXFmE8Eq8eLoju5y82KbxBSBgaSX7aYU+qRlv+juIN
        PP9h5+KTd3kVaTa9IepSb+CR/BhIDkjkvgQjbivFw==
X-ME-Sender: <xms:JVOQXNbSntYrfwQaztfwGgzXwk6F6zdCF82DwuiFAVNPPEnIrQf3zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrieefgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhepfffhvf
    fukfggtgguofgfsehttdertdforedvnecuhfhrohhmpedfvfhosghinhcuvedrucfjrghr
    ughinhhgfdcuoehmvgesthhosghinhdrtggtqeenucfkphepuddvgedrudeiledrudegle
    drgedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthhosghinhdrtggtnecuvehl
    uhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:JVOQXP5SIzneCpxbmKDh9AEInd05Xc7TLaJAExXQna6zts-nT8K5pg>
    <xmx:JVOQXG_NliaQc-Zr8P28a37cacWGroJmzc4ZW3zLQWhf5H_6Zru_Ug>
    <xmx:JVOQXEk48AfkTttoNDRCD0eVe5wkOocLgu3EYRMBavOu_bHKF3NMQw>
    <xmx:JVOQXDm5fQULnmBnutzMsUxYHBRaSNQyJf_5hQ7PMKz_bqfusM3nAw>
Received: from localhost (124-169-149-40.dyn.iinet.net.au [124.169.149.40])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7C2CCE4176
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 22:25:40 -0400 (EDT)
Date:   Tue, 19 Mar 2019 13:25:14 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     linux-doc@vger.kernel.org
Subject: Documenting struct function pointers (methods)
Message-ID: <20190319022514.GA3622@eros.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: Mutt 1.11.4 (2019-03-13)
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Is documenting 'methods' i.e. function pointers in structs like 'struct
file_operations' something that we do anywhere?  Is this handled by RST?
Is it something that has been discussed already?

I'm in the process of trying to grok the dcache and update the docs.
For each function pointer I'm reading various implementations and trying
to work out what the method is supposed to do.  Surely this is a good
candidate for improving kernel documentation in order to help devs come
up to speed more quickly?

An example from include/linux/fs.h (adding docstring comments to struct
file_system_type).  This is _not_ handled correctly by Sphinx, is there
a way to do this?  Or are hard-core hackers going to scream that this is
too much documentation :)


/**
 * struct file_system_type
 * @name: Name of the filesystem type, such as "ext2", "iso9660",
 *        "msdos" and so on.
 * @fs_flags: Various flags (i.e. FS_REQUIRES_DEV, FS_NO_DCACHE, etc.).
 * ...
 */
struct file_system_type {
       [snip]
	const struct fs_parameter_description *parameters;
	/**
	 * @mount: The method to call when a new instance of this
	 *         filesystem should be mounted.
	 *
	 * The mount() method has the following arguments:
	 * @fs_type: Describes the filesystem, partly initialized by the
	 *           specific filesystem code.
	 * @flags: Mount flags.
	 * @dev_name: The device name we are mounting.
	 * @data: Arbitrary mount options, usually comes as an ASCII
	 *        string (see "Mount Options" section).
	 */
	struct dentry *(*mount) (struct file_system_type *fs_type, int flags,
				 const char *dev_name, void *data);
	void (*kill_sb) (struct super_block *);


thanks,
Tobin.
